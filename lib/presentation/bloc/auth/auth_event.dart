part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLogInEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLogInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthRegisterEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [];
}

class AuthResetPasswordEvent extends AuthEvent {
  final String email;

  const AuthResetPasswordEvent( {required  this.email});

  @override
  List<Object?> get props => [email];
}

class AuthLogOutEvent extends AuthEvent {
  const AuthLogOutEvent();

  @override
  List<Object?> get props => [];
}