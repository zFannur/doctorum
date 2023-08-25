import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:doctorum/presentation/navigation/navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctorum/const/app_theme.dart';
import 'package:doctorum/locator_service/locator_service.dart';
import 'package:doctorum/presentation/navigation/navgation.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({Key? key, required this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: theme,
          darkTheme: darkTheme,
          initialRoute: RouteNames.navigationBar,
          routes: Navigation.routes,
        ),
      ),
    );
  }
}
