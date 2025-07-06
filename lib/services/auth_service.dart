// import 'dart:js_interop';

import 'package:agenda_ja_app/layout/snack_message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerUser ({required String name, required String email, required String password}) async {
    try {
      UserCredential userReturn = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await userReturn.user!.updateDisplayName(name);
      if(userReturn.user == null){
        SnackMessage().Error('Erro ao cadastrar');
      } else {
        SnackMessage().SuccessMessage('Sucesso ao cadastrar');
      }
    } on FirebaseAuthException catch (e,s) {
      // TODO
      SnackMessage().Error(e.code);
    }
  }

  Future<String?>loginUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return SnackMessage().Error(e.message!);
    }
  }
  Future<void> logoutUser() async {
    return _firebaseAuth.signOut();
  }
}