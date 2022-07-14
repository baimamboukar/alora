import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  // ignore: unused_field
  final Ref _ref;
  final FirebaseAuth _auth;
  const FirebaseAuthentication(this._ref, this._auth);
  Stream<User?> get getAuthUser => _auth.authStateChanges();
  bool get isSignedIn => _auth.currentUser != null;
  //login user and provide his data to the app once done
  Future<void> loginUser({required String mail, required String pass}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        debugPrint(response.toString());
      });
    } on FirebaseAuthException catch (err) {
      debugPrint(err.toString());
    }
  }

  //sign up the user and store his data to firestore
  Future<UserCredential?> signupUser({
    required String mail,
    required String pass,
  }) async {
    //late UserCredential? response;
    try {
      await _auth
          .createUserWithEmailAndPassword(email: mail, password: pass)
          .then((response) async {
        return response;
      });
    } on FirebaseAuthException {
      debugPrint("Error");
    }
    return null;
  }

  //simply logs out the user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut().then((res) => debugPrint("Done"));
    } on FirebaseAuthException catch (err) {
      debugPrint(err.toString());
    }
  }
}
