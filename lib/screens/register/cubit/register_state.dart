part of 'register_cubit.dart';

enum RegisterStatus { initial, submitting, success }

class RegisterState extends Equatable {
  final String phone;
  final String firstName;
  final String lastName;
  final RegisterStatus status;

  const RegisterState({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      phone: '',
      firstName: '',
      lastName: '',
      status: RegisterStatus.initial,
    );
  }

  RegisterState copyWith({
    String? phone,
    String? firstName,
    String? lastName,
    RegisterStatus? status,
  }) {
    return RegisterState(
        phone: phone ?? this.phone,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [phone, firstName, lastName];
}
