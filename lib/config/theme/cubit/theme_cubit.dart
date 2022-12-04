
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  static final _defaultTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[300],
    primaryColor: Colors.redAccent ,
    appBarTheme: const AppBarTheme(color: Colors.redAccent),
    brightness: Brightness.light,
  );

  void changeTheme(ThemeData themeData){
    emit(themeData);
  }
}


