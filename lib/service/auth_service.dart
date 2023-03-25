import 'dart:developer';

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //? login
  Future<bool?> logInWithEmailAndPassword(String email, String password) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  //? register
  Future<bool?> registerSignWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // calls database service to update the user data
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return false;
    }
  }

  //? logOut
  Future logOut() async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmailSF("");
      await HelperFunction.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
