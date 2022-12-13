part of 'theme_cubit.dart';

@immutable
abstract class ThemeCubitState {}

class ThemecubitInitial extends ThemeCubitState {
  ThemecubitInitial();
}

class ThemeModeChangedState extends ThemeCubitState {
  ThemeMode currentTheme;
  ThemeModeChangedState({
    required this.currentTheme,
  });
}


class ThemeValueAddedState extends ThemeCubitState {
  int currentValue;
  ThemeValueAddedState(
      { required this.currentValue});
}
