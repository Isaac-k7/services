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
    String userName,
    String password,
  ) async {
    provider = AuthenticationProvider.service;
    final response = await Api.post(
      'token/',
      body: {
        'username': userName.trim(),
        'password': password.trim(),
      },
    );
    if (response.statusCode == HttpStatus.ok) {
      ApiSuccess success = ApiSuccess(response);
      await _storeTokenInfo(success.data['token']);
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
    Api.addHeader('Authorization', 'Token $_token');

    if (await getUser() is User) {
      return true;
    }
    return false;
  }

  @override
  Future<User?> getUser() async {
    if (_token != null && _token != '') {
      final response = await Api.get('user/');
      if (response.statusCode == HttpStatus.ok) {
        ApiSuccess success = ApiSuccess(response);
      
        return User.fromMap(success.data['results'][0]);
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
      Api.addHeader('Authorization', 'Token $_token');
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
    {required String firstName,
    required String lastName,
    required String phone,
    required String username,
    required String email,
    required String password,}
  ) async {

    String errorFirstName = '';
    String errorLastName = '';
    String errorPhone = '';
    String errorPassword = '';
    String errorEmail= '';
    String errorRole = '';
    provider = AuthenticationProvider.service;
    final response = await Api.post(
      'users/',
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Accept-Language': 'fr',
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: {
        'username': username.trim(),
        'phone': phone.trim(),
        'first_name': firstName.trim(),
        'last_name': lastName.trim(),
        'password': password.trim(),
        'email': email.trim()
      },
    );
    if (response.statusCode == HttpStatus.created) {
      ApiSuccess success = ApiSuccess(response);
      await _storeTokenInfo(success.data['token']);
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
          case 'phone':
            {
              errorPhone = failure.errors![field][0]['description'];
              return '${failure.message}: $errorPhone';
            }
          case 'email':
            {
              errorEmail = failure.errors![field][0]['description'];
              return '${failure.message}: $errorEmail';
            }
          case 'password':
            {
              errorPassword = failure.errors![field][0]['description'];
              return '${failure.message}: $errorPassword';
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
