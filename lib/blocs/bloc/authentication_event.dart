part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];


}

class  AuthenticationEventAppStarted extends AuthenticationEvent{}
class  AuthenticationEventLoggedIn extends AuthenticationEvent{
  final String phone;

  const AuthenticationEventLoggedIn(this.phone);

  @override
  List<Object> get props => [phone];
}
class  AuthenticationEventLoggedOut extends AuthenticationEvent{}
class  AuthenticationEventLoggedWithFacebook extends AuthenticationEvent{}
class  AuthenticationEventLoggedWithApple extends AuthenticationEvent{}
class  AuthenticationEventRegister extends AuthenticationEvent{
  final String phone;
  final String firstName;
  final String lastName;
  const AuthenticationEventRegister({required this.phone, required this.firstName, required this.lastName});
}
