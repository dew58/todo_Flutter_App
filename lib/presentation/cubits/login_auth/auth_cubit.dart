import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/routes/settings.dart';
import '../../../main.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial());

  /// Log in using firebasa and open hive box for the user
  Future logIn(String email, String password) async {
    emit(AuthLoading());
    try {
      UserCredential credential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uId = credential.user!.uid;

      box = await Hive.openBox('myTodo$uId');

      debugPrint('User logged in and Hive box reopened: $uId');
      emit(AuthSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  /// Sign up using firebasa and open hive box for the user
  Future<void> signUP(String emailAddress, String password) async {
    emit(AuthLoading());
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      String uId = credential.user!.uid;

      box = await Hive.openBox('myTodo$uId');

      debugPrint('User Signed up and Hive box opened: $uId');

      emit(AuthSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  /// Log Out the user and close the hive box
  Future<void> logOut(BuildContext context) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.of(context).pushReplacementNamed(
        Routers.logIn,
      );
      emit(AuthInitial());
      await Hive.close();
      print('User logged out and Hive box colsed:');
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
    }
  }

  /// Sign in with google and open hive box for the user
  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential credentiall =
          await FirebaseAuth.instance.signInWithCredential(credential);
      String uId = credentiall.user!.uid;

      box = await Hive.openBox('myTodo$uId');

      debugPrint('User Signed up and Hive box opened: $uId');

      emit(AuthSuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AuthError(e.toString()));
    }
  }
}
