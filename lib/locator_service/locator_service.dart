import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:doctorum/bloc_observable.dart';
import 'package:doctorum/domain/use_case/auth/auth.dart';
import 'package:doctorum/domain/use_case/auth/auth_impl.dart';

import 'package:doctorum/presentation/notification/notification.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  Bloc.observer = CharacterBlocObservable();
  NotificationService().initNotification();
  //data

  //domain
  getIt.registerFactory<Auth>(() =>AuthImpl());

  //presentation
  getIt.registerSingleton(AuthBloc(getIt<Auth>()));
}