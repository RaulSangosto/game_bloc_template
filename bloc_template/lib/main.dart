import 'package:bloc_template/store_config.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'app/pages/my_app_page.dart';
import 'games_services/games_services.dart';
import 'ids.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage;
  // Game Services
  GamesServicesController? gamesServicesController;
  if (!kIsWeb && (Platform.isIOS || Platform.isAndroid)) {
    gamesServicesController = GamesServicesController()
      // Attempt to log the player in.
      ..initialize();
  }

  if (!kIsWeb) {
    if (Platform.isIOS || Platform.isMacOS) {
      StoreConfig(
        store: Store.appleStore,
        apiKey: IdsConstants.appleApiKey,
      );
    } else if (Platform.isAndroid) {
      StoreConfig(
        store: Store.googlePlay,
        apiKey: IdsConstants.googleApiKey,
      );
    }
  }

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [Locale('en', 'US'), Locale('es', 'ES')],
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(
        gamesServicesController: gamesServicesController,
      ),
    ),
  );
}
