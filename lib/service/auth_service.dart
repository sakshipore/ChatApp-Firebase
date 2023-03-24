import 'dart:developer';

import 'package:chat_app/service/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //? login

  //? register
  Future registerSignWithEmailAndPassword(
      String fullName, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // calls database service to update the user data
        await DatabaseService(uid: user.uid).updatingUserData(fullName, email);
        return true;
      }
    } on FirebaseAuthException catch (e) {
      log(e.toString());
      return e.message;
    }
  }

  //? signOut
}
