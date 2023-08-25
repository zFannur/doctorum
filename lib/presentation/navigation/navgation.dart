import 'package:flutter/material.dart';

import 'package:doctorum/presentation/screens/signin_screen.dart';
import 'navigation_bar.dart';

class RouteNames {
  static String navigationBar = '/';
  static String register = '/register';

}

class Navigation {
  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      RouteNames.navigationBar: (context) => const NavigationBottomBar(),
      RouteNames.register: (context) => const SignInScreen(),
    };
  }
}