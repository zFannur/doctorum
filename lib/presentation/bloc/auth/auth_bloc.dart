import 'dart:developer';
import 'package:doctorum/resource/langs/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doctorum/domain/use_case/auth/auth.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Auth auth;

  AuthBloc(this.auth) : super(const AuthState()) {
    on<AuthLogInEvent>(_onAuthLogInEvent);
    on<AuthLogOutEvent>(_onAuthLogOutEvent);
    on<AuthRegisterEvent>(_onAuthRegisterEvent);
    on<AuthResetPasswordEvent>(_onAuthResetPasswordEvent);
  }

  void _onAuthLogInEvent(AuthLogInEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(isLoading: true));
    try {
      await auth.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(const AuthState(isLoading: false, isLogInSuccessful: true));
    } on FirebaseAuthException catch (e) {
      log("Exception on LogIn------------->${e}");
      emit(AuthState(isLoading: false, isLogInError: e.toString()));
    }
  }

  void _onAuthLogOutEvent(AuthLogOutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(isLoading: true));
    try {
      await auth.signOut();
      emit(const AuthState(isLoading: false, isLogInSuccessful: false));
    } on FirebaseAuthException catch (e) {}
  }

  void _onAuthRegisterEvent(AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(isLoading: true));
    try {
      await auth.createUserWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(const AuthState(isLoading: false, isLogInSuccessful: true));
    } on FirebaseAuthException catch (e) {
      log("Exception on SignUp------------->${e}");
      emit(AuthState(isLoading: false, isSignInError: e.toString()));
    }
  }

  void _onAuthResetPasswordEvent(AuthResetPasswordEvent event, Emitter<AuthState> emit) async {
    emit(const AuthState(isLoading: true));
    try {
      await auth.sendResetPasswordEmail(email: event.email);
      emit(AuthState(isLoading: false, isLogInError: LocaleKeys.checkEmailTitle.tr()));
    } on FirebaseAuthException catch (e) {
      log("Exception on LogIn------------->${e}");
      emit(AuthState(isLoading: false, isLogInError: e.toString()));
    }
  }
}
