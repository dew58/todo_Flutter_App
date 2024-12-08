import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
}
