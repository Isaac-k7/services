
import 'package:achilleservice/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_defaultTheme);

  static final _defaultTheme = AppTheme.defaultTheme;

  void changeTheme(ThemeData themeData){
    emit(themeData);
  }
}


