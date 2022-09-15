import 'package:bloc_template/theme/main_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../state/bloc/theme/theme_bloc.dart';
import '../../ui/buttons.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Text(
                      "Options Page",
                      style: titleTextStyle(themeState.theme),
                    ),
                  ),
                ),
                Expanded(
                  child: SecondaryBlockButton(
                    child: const Text("theme_button").tr(),
                    onPressed: () => GoRouter.of(context).pushNamed("theme"),
                  ),
                ),
                const SizedBox.square(
                  dimension: 10,
                ),
                Expanded(
                  child: AccentBlockButton(
                    child: const Text("credits_button").tr(),
                    onPressed: () => GoRouter.of(context).pushNamed("credits"),
                  ),
                ),
                const SizedBox.square(
                  dimension: 10,
                ),
                Expanded(
                  child: BlockButton(
                    child: const Text("back_button").tr(),
                    onPressed: () => GoRouter.of(context).pop(),
                  ),
                ),
                const SizedBox.square(
                  dimension: 30,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
