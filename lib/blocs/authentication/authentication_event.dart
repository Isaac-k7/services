part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationEventAppStarted extends AuthenticationEvent {}

class AuthenticationEventLoggedIn extends AuthenticationEvent {
  final String userName;
  final String password;

  const AuthenticationEventLoggedIn(
      {required this.userName, required this.password});

  @override
  List<Object> get props => [userName];
}

class AuthenticationEventLoggedOut extends AuthenticationEvent {}

class AuthenticationEventLoggedWithFacebook extends AuthenticationEvent {}

class AuthenticationEventLoggedWithApple extends AuthenticationEvent {}

class AuthenticationEventRegister extends AuthenticationEvent {
  final String username;
  final String email;
  final String phone;
  final String firstName;
  final String lastName;
  final String password;
  const AuthenticationEventRegister(
      {required this.username,
      required this.email,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.password});
  @override
  List<Object> get props => [
        username,
        email,
        phone,
        firstName,
        lastName,
        password,
      ];
}
