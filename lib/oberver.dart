import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    if(bloc is Bloc)print (change.toString());
  }


}