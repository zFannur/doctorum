import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:doctorum/resource/langs/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'internal/application.dart';
import 'locator_service/locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init();

  runApp(EasyLocalization(
    // for generate parser dart run easy_localization:generate -S "lib/resource/langs" -O "lib/resource/langs"
    // for generate keys dart run easy_localization:generate -f keys -o locale_keys.g.dart -S "lib/resource/langs" -O "lib/resource/langs"
    supportedLocales: const [Locale('en')],
    path: 'lib/resource/lang',
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: MyApp(savedThemeMode: savedThemeMode),
  ),);
}

