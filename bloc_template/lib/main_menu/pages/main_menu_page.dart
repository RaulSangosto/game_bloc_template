import 'package:bloc_template/state/bloc/theme/theme_bloc.dart';
import 'package:bloc_template/theme/main_theme.dart';
import 'package:bloc_template/ui/buttons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    "Main Menu",
                    style: titleTextStyle(themeState.theme),
                  ),
                ),
              ),
              Expanded(
                child: AccentBlockButton(
                  child: const Text("shop_button").tr(),
                  onPressed: () => GoRouter.of(context).pushNamed("shop"),
                ),
              ),
              const SizedBox.square(
                dimension: 10,
              ),
              Expanded(
                child: SecondaryBlockButton(
                  child: const Text("settings_button").tr(),
                  onPressed: () => GoRouter.of(context).pushNamed("options"),
                ),
              ),
              const SizedBox.square(
                dimension: 10,
              ),
              Expanded(
                child: BlockButton(
                  child: const Text("play_button").tr(),
                  onPressed: () => GoRouter.of(context).pushNamed("play"),
                ),
              ),
              const SizedBox.square(
                dimension: 30,
              ),
            ],
          ),
        );
      }),
    );
  }
}
