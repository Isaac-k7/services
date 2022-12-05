import 'package:bloc/bloc.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<bool> {
  ConfigCubit() : super(false);
  
  void initialState(){
    emit(false);
  }
  void changeValue(bool isShow){
    emit(!isShow);
  }
}
