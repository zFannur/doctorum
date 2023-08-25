part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final String isLogInError;
  final String isSignInError;
  final bool isLogInSuccessful;

  const AuthState({
    this.isLoading = false,
    this.isLogInError = '',
    this.isSignInError = '',
    this.isLogInSuccessful = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? isLogInError,
    String? isSignInError,
    bool? isLogInSuccessful,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isLogInError: isLogInError ?? this.isLogInError,
      isSignInError: isSignInError ?? this.isSignInError,
      isLogInSuccessful: isLogInSuccessful ?? this.isLogInSuccessful,
    );
  }

  @override
  List<Object?> get props => [isLoading, isLogInError, isSignInError, isLogInSuccessful];
}
