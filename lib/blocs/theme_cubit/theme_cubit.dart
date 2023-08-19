import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';


class ThemeModeState {
  final ThemeMode themeMode;
  ThemeModeState(this.themeMode);
}


class ThemeCubit extends Cubit<ThemeModeState> {
  ThemeCubit() : super(ThemeModeState(ThemeMode.light));

  void  toggleTheme(){
    emit(ThemeModeState(state.themeMode == ThemeMode.light? ThemeMode.dark :ThemeMode.light));
  }
}
