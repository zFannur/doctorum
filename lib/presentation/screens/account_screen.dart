import 'package:doctorum/domain/auth/auth.dart';
import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:doctorum/presentation/screens/account_welcome_screen.dart';
import 'package:doctorum/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../locator_service/locator_service.dart';
import 'login_screen.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>().state;
    final auth = getIt<Auth>();
    return StreamBuilder(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (authBloc.isLogInSuccessful) {
              return const AccountWelcomeScreen();
            } else {
              return const LogInScreen();
            }
          },
        );
      },
    );
  }
}
