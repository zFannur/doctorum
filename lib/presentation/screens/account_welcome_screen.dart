import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';
import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';

class AccountWelcomeScreen extends StatelessWidget {
  const AccountWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(const AuthLogOutEvent());
              },
              child: Text(LocaleKeys.logOutTitle.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
