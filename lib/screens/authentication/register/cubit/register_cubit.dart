import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  void changeUsername(String value) {
    return emit(
      state.copyWith(username: value, status: RegisterStatus.initial),
    );
  }
  void changeEmail(String value) {
    return emit(
      state.copyWith(email: value, status: RegisterStatus.initial),
    );
  }
  void changePhone(String value) {
    return emit(
      state.copyWith(phone: value, status: RegisterStatus.initial),
    );
  }
  void changeFistName(String value) {
    return emit(
      state.copyWith(firstName: value, status: RegisterStatus.initial),
    );
  }
  void changeLastName(String value) {
    return emit(
      state.copyWith(lastName: value, status: RegisterStatus.initial),
    );
  }
  void changePassword(String value) {
    return emit(
      state.copyWith(password: value, status: RegisterStatus.initial),
    );
  }
}
