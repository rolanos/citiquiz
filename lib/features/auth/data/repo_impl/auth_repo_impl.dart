import 'dart:developer';

import 'package:citiquiz/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<void> signIn(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      preferences.setString('email', email);
      preferences.setString('password', password);
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      preferences.setString('email', email.trim());
      preferences.setString('password', password.trim());
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
