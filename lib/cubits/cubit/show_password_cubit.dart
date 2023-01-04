import 'package:bloc/bloc.dart';

class ShowPasswordCubit extends Cubit<bool> {
  ShowPasswordCubit() : super(true);

  togglePassword(bool currentValue)=> emit(!currentValue);
}
