part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class SetTheme extends ThemeEvent {
  final ThemeItemData theme;

  SetTheme(this.theme);
}
