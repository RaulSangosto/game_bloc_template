import 'package:bloc_template/theme/main_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../state/bloc/theme/theme_bloc.dart';
import '../../ui/buttons.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({Key? key}) : super(key: key);

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
                      "Credits Page",
                      style: titleTextStyle(themeState.theme),
                    ),
                  ),
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
