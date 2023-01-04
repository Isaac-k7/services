import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void changeUserName(String value) {
    return emit(
      state.copyWith(phone: value, status: LoginStatus.initial),
    );
  }
  void changePassword(String value) {
    return emit(
      state.copyWith(password: value, status: LoginStatus.initial),
    );
  }
}
