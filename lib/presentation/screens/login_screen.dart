import 'package:doctorum/domain/entity/doctor.dart';
import 'package:doctorum/domain/use_case/firestore/firestore.dart';
import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';
import 'package:doctorum/presentation/navigation/navgation.dart';

import '../notification/notification.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    final authBloc = context.watch<AuthBloc>().state;

    return Scaffold(
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
                context
                    .read<AuthBloc>()
                    .add(AuthResetPasswordEvent(email: email));
              },
              child: Text(
                LocaleKeys.resetPasswordTitle.tr(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(AuthLogInEvent(email: email, password: password));
              },
              child: Text(
                LocaleKeys.logInTitle.tr(),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteNames.register);
              },
              child: Text(
                LocaleKeys.signInTitle.tr(),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     NotificationService().showNotification(
            //         1, 'Notification_title.text','Notification_descrp.text');
            //   },
            //   child: Text(
            //     'Notification',
            //   ),
            // ),
            Visibility(
              visible: authBloc.isLogInError.isNotEmpty,
              child: Text(
                authBloc.isLogInError,
                style: const TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
