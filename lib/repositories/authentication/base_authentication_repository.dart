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
    String userName,
    String password,
  );
  Future<bool> isSignedIn();
  Future<User?> getUser();
  Future<void> logOut();
  Future<String?> register(
    {required String username,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String phone,}
  );
}
