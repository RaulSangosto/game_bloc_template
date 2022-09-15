part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {
  final ThemeItemData theme;

  const ThemeState(this.theme);
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(themes[0]);
}

class ThemeCurrent extends ThemeState {
  const ThemeCurrent(super.theme);
}
