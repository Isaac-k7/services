part of 'register_cubit.dart';

enum RegisterStatus { initial, submitting, success }

class RegisterState extends Equatable {
  final String phone;
  final String firstName;
  final String lastName;
  final String password;
  final RegisterStatus status;

  const RegisterState({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.status,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      phone: '',
      firstName: '',
      lastName: '',
      password: '',
      status: RegisterStatus.initial,
    );
  }

  RegisterState copyWith({
    String? phone,
    String? firstName,
    String? lastName,
    String? password,
    RegisterStatus? status,
  }) {
    return RegisterState(
        phone: phone ?? this.phone,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [phone, firstName, lastName,password];
}
