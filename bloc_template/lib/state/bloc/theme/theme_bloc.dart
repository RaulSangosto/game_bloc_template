import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import 'model/theme_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeInitial()) {
    on<SetTheme>((event, emit) => emit(_setTheme(event)));
  }

  ThemeState _setTheme(SetTheme event) {
    return ThemeCurrent(event.theme);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      final theme = ThemeItemData.fromJson(json);
      return ThemeCurrent(theme);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    if (state is ThemeCurrent) {
      return state.theme.toJson();
    }
    return null;
  }
}
