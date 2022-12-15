import 'dart:async';
import 'dart:io';
import 'package:achilleservice/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:achilleservice/services/api/api.dart';

import 'base_authentication_repository.dart';

class AuthenticationRepository extends BaseAuthenticationRepository {
  final FlutterSecureStorage storage;

  AuthenticationRepository({this.storage = const FlutterSecureStorage()});

  String? _token;

  @override
  Future<String?> logIn(
    String phone,
  ) async {
    provider = AuthenticationProvider.service;
    final response = await Api.post(
      'oauth/login',
      body: {
        'phone': phone.trim(),
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      ApiSuccess success = ApiSuccess(response);
      await _storeTokenInfo(success.data['access_token']);
      if (_token != null) {
        return null;
      }
    }
    ApiFailure failure = ApiFailure(response);
    return failure.description == '' ? 'Unknown error' : failure.description;
  }

  @override
  Future<bool> isSignedIn() async {
    _token = await storage.read(key: 'access_token');
    final storedProvider = await storage.read(key: 'provider');
    provider = storedProvider != null
        ? AuthenticationProvider.values[int.parse(storedProvider)]
        : null;
    if (_token == null) return false;
    Api.addHeader('Authorization', 'Bearer $_token');

    if (await getUser() is User) {
      return true;
    }
    return false;
  }

  @override
  Future<User?> getUser() async {
    if (_token != null && _token != '') {
      final response = await Api.get('account/user');
      if (response.statusCode == HttpStatus.ok) {
        ApiSuccess success = ApiSuccess(response);
      
        return User.fromMap(success.data);
      }
      await logOut();
    }
    return null;
  }
  @override
  Future<void> logOut() async {
    await _deleteTokenInfo();
  }

  Future<void> _storeTokenInfo(String? token) async {
    _token = token;
    if (_token != null) {
      await storage.write(key: 'access_token', value: _token);
      if (provider != null) {
        await storage.write(key: 'provider', value: provider!.index.toString());
      }
      Api.addHeader('Authorization', 'Bearer $_token');
    }
  }

  Future<void> _deleteTokenInfo() async {
    await storage.delete(key: 'access_token');
    await storage.delete(key: 'provider');
    Api.removeHeader('Authorization');
    _token = null;
  }

  @override
  Future<String?> register(
    String firstName,
    String lastName,
    String phone,
  ) async {

    String errorFirstName = '';
    String errorLastName = '';
    String errorPhone = '';
    String errorRole = '';
    provider = AuthenticationProvider.service;
    final response = await Api.post(
      'oauth/register',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept-Language': 'fr',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: {
        'username': phone.trim(),
 
        'first_name': firstName.trim(),
        'last_name': lastName.trim(),
        'role_slug': 'student'
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      ApiSuccess success = ApiSuccess(response);
      await _storeTokenInfo(success.data['access_token']);
      if (_token != null) {
        return null;
      }
    }
    ApiFailure failure = ApiFailure(response);
    if (failure.errors != null) {
      Iterable<String>? fields = failure.errors?.keys;
      for (String? field in fields!) {
        switch (field) {
          case 'first_name':
            {
              errorFirstName = failure.errors![field][0]['description'];
              return '${failure.message}: $errorFirstName';
            }
          case 'last_name':
            {
              errorLastName = failure.errors![field][0]['description'];
              return '${failure.message}: $errorLastName';
            }
          case 'gender':
            {
              errorPhone = failure.errors![field][0]['description'];
              return '${failure.message}: $errorPhone';
            }
          case 'role_slug':
            {
              errorRole = failure.errors![field][0]['description'];
              return '${failure.message}: $errorRole';
            }
          default:
            {
              return failure.message;
            }
        }
      }
    }
    return failure.message;
  }

}
