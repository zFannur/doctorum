import 'package:firebase_auth/firebase_auth.dart';

abstract class Auth {
  User? get currentUser;
  Stream<User?> get authStateChanges;

  Future<void> signInWithEmailAndPassword({required String email, required String password});
  Future<void> createUserWithEmailAndPassword({required String email, required String password});
  Future<void> sendResetPasswordEmail({required String email});
  Future<void> signOut();
}
