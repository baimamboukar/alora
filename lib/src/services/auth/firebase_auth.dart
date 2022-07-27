// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirebaseAuthentication {
  final Ref _ref;
  final FirebaseAuth _auth;
  const FirebaseAuthentication(this._ref, this._auth);
  static bool get isPreniumUser =>
      FirebaseAuth.instance.currentUser?.displayName?.endsWith(' - prenium') ??
      false;
  Stream<User?> get getAuthUser => _auth.authStateChanges();
  bool get isSignedIn => _auth.currentUser != null;
  //login user and provide his data to the app once done
  Future<UserCredential> loginUser({
    required String mail,
    required String pass,
  }) async {
    late UserCredential creds;
    try {
      creds =
          await _auth.signInWithEmailAndPassword(email: mail, password: pass);

      return creds;
    } on FirebaseAuthException catch (err) {
      throw Exception(err);
    }
  }

  //sign up the user and store his data to firestore
  Future<UserCredential?> signupUser(
      {required String mail,
      required String pass,
      required String name}) async {
    late UserCredential? response;
    try {
      response = await _auth.createUserWithEmailAndPassword(
          email: mail, password: pass);
      response.user!.updateDisplayName(name);
      return response;
    } on FirebaseAuthException catch (err) {
      throw Exception(err);
    }
  }

  //simply logs out the user
  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (err) {
      debugPrint(err.toString());
    }
  }
}
