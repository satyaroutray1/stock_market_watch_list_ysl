import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_watch_list/bloc/theme/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(ThemeData.dark()) {
    on<ThemeChangeEvent>(onThemeChange);

  }
  onThemeChange(ThemeChangeEvent event, Emitter<ThemeData> emit) async {
    bool isDarkTheme = false;
    if (isDarkTheme) {
      emit(ThemeData.dark());
    } else {
      emit(ThemeData.light());
    }
  }

}