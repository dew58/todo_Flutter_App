import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthCubit(this._firebaseAuth, firebaseAuth) : super(AuthInitial());

  Future logIn(String email, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthSuccess());
      print("llllllllllloooooooooooooggggeddddd");
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signUP(String emailAddress, String password) async {
    emit(AuthLoading());
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      emit(AuthSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(AuthError(e.toString()));
    } catch (e) {
      print(e);
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}