import 'dart:async';
import 'package:achilleservice/models/user.dart';

enum AuthenticationProvider {
  service,
  facebook,
  apple,
  google,
}

abstract class BaseAuthenticationRepository {
  AuthenticationProvider? provider;

  Future<String?> logIn(
    String phone,
  );
  Future<bool> isSignedIn();
  Future<User?> getUser();
  Future<void> logOut();
  Future<String?> register(
    {required String firstName,
    required String lastName,
    required String password,
    required String phone,}
  );
}
