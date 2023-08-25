import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    final authBloc = context.watch<AuthBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.signInTitle.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(hintText: LocaleKeys.emailTitle.tr()),
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              decoration:
                  InputDecoration(hintText: LocaleKeys.passwordTitle.tr()),
            ),
            TextButton(
              onPressed: () {
                if (email.contains('@') && password.length > 6) {
                  context
                      .read<AuthBloc>()
                      .add(AuthRegisterEvent(email: email, password: password));
                }
              },
              child: Text(
                LocaleKeys.signInTitle.tr(),
              ),
            ),
            Visibility(
              visible: authBloc.isSignInError.isNotEmpty,
              child: Text(
                authBloc.isSignInError,
                style: const TextStyle(color: Colors.red),
              ),
            ),
            Visibility(
              visible: authBloc.isLogInSuccessful,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  LocaleKeys.logInTitle.tr(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
