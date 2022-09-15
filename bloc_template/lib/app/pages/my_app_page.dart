import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../games_services/games_services.dart';
import '../../main_menu/pages/main_menu_page.dart';
import '../../options/pages/credits_page.dart';
import '../../options/pages/options_page.dart';
import '../../play/pages/play_page.dart';
import '../../shop/pages/shop_page.dart';
import '../../state/bloc/sound/sound_bloc.dart';
import '../../state/bloc/theme/theme_bloc.dart';
import '../../state/cubit/game_services/game_services_cubit.dart';
import '../../theme/main_theme.dart';
import '../../theme/pages/theme_page.dart';
import '../../ui/my_transition.dart';
import '../../ui/snack_bar.dart';

class MyApp extends StatelessWidget {
  final GamesServicesController? gamesServicesController;

  const MyApp({
    Key? key,
    required this.gamesServicesController,
  }) : super(key: key);

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'main-menu',
        builder: (context, state) {
          final light = Theme.of(context).brightness;
          final dark =
              light == Brightness.light ? Brightness.dark : Brightness.light;

          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarBrightness: light,
              statusBarIconBrightness: dark,
            ),
            child: const MainMenuPage(key: Key('main-menu')),
          );
        },
      ),
      GoRoute(
        path: '/play',
        name: 'play',
        pageBuilder: (context, state) {
          final light = Theme.of(context).brightness;
          final dark =
              light == Brightness.light ? Brightness.dark : Brightness.light;

          return buildMyTransition(
            name: 'play',
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarBrightness: light,
                statusBarIconBrightness: dark,
              ),
              child: const PlayPage(key: Key('play')),
            ),
          );
        },
      ),
      GoRoute(
        path: '/theme',
        name: 'theme',
        pageBuilder: (context, state) {
          final light = Theme.of(context).brightness;
          final dark =
              light == Brightness.light ? Brightness.dark : Brightness.light;

          return buildMyTransition(
            name: 'theme',
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarBrightness: light,
                statusBarIconBrightness: dark,
              ),
              child: const ThemePage(key: Key('theme')),
            ),
          );
        },
      ),
      GoRoute(
        path: '/shop',
        name: 'shop',
        pageBuilder: (context, state) {
          final light = Theme.of(context).brightness;
          final dark =
              light == Brightness.light ? Brightness.dark : Brightness.light;

          return buildMyTransition(
            name: 'shop',
            child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                statusBarBrightness: light,
                statusBarIconBrightness: dark,
              ),
              child: const ShopPage(key: Key('shop')),
            ),
          );
        },
      ),
      GoRoute(
          path: '/options',
          name: 'options',
          pageBuilder: (context, state) {
            final light = Theme.of(context).brightness;
            final dark =
                light == Brightness.light ? Brightness.dark : Brightness.light;

            return buildMyTransition(
              name: 'options',
              child: AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle(
                  statusBarBrightness: dark,
                  statusBarIconBrightness: light,
                ),
                child: const OptionsPage(key: Key('options')),
              ),
              brightness: light,
            );
          },
          routes: [
            GoRoute(
              path: 'options/credits',
              name: 'credits',
              pageBuilder: (context, state) {
                final light = Theme.of(context).brightness;
                final dark = light == Brightness.light
                    ? Brightness.dark
                    : Brightness.light;

                return buildMyTransition(
                  name: 'credits',
                  child: AnnotatedRegion<SystemUiOverlayStyle>(
                    value: SystemUiOverlayStyle(
                      statusBarBrightness: light,
                      statusBarIconBrightness: dark,
                    ),
                    child: const CreditsPage(key: Key('credits')),
                  ),
                  brightness: light,
                );
              },
            ),
          ]),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    log(EasyLocalization.of(context)?.locale.toString() ?? "",
        name: "${toString()}# locale");
    log(Intl.defaultLocale.toString(),
        name: "${toString()}# Intl.defaultLocale");
    return MultiBlocProvider(
      providers: [
        BlocProvider<SoundBloc>(
          create: (_) => SoundBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider<GameServicesCubit>(
          create: (_) => GameServicesCubit(gamesServicesController),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: getMainTheme(state.theme),
            scaffoldMessengerKey: scaffoldMessengerKey,
          );
        },
      ),
    );
  }
}
