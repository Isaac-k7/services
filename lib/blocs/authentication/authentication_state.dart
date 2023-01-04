part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

class AuthenticationStateUninitialized extends AuthenticationState {}

class AuthenticationStateAuthenticated extends AuthenticationState {
  final User user;

  const AuthenticationStateAuthenticated(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationStateLoading extends AuthenticationState {
  final AuthenticationProvider? provider;

  const AuthenticationStateLoading({this.provider});

  @override
  List<Object> get props => [provider?.toString() ?? ''];

  @override
  String toString() => provider?.toString() ?? '';
}

class AuthenticationStateAuthencated extends AuthenticationState {}

class AuthenticationStateUnauthenticated extends AuthenticationState {
  final String? errorMessage;
  const AuthenticationStateUnauthenticated({this.errorMessage});

  @override
  List<Object> get props => [errorMessage ?? ''];

  @override
  String toString() => errorMessage ?? '';
}