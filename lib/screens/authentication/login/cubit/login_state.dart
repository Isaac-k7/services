part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success }

class LoginState extends Equatable {
  final String phone;
  final String firstName;
  final String lastName;
  final String password;
  final LoginStatus status;

  const LoginState({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      phone: '',
      firstName: '',
      lastName: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  LoginState copyWith({
    String? phone,
    String? firstName,
    String? lastName,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
        phone: phone ?? this.phone,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [phone, firstName, lastName,password];
}
