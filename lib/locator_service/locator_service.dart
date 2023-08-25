import 'package:doctorum/domain/auth/auth.dart';
import 'package:doctorum/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc_observable.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
  Bloc.observer = CharacterBlocObservable();

  //data

  //domain
  getIt.registerFactory<Auth>(() =>AuthImpl());

  //presentation
  getIt.registerSingleton(AuthBloc(getIt<Auth>()));
}