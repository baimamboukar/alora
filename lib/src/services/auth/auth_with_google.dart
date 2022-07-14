import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthWithGoogle {
  final Ref _ref;
  final FirebaseAuth _auth;
  AuthWithGoogle(this._ref, this._auth);

  final googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/user.birthday.read',
      'https://www.googleapis.com/auth/userinfo.profile',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final cred = await _auth.signInWithCredential(credential);
    return cred;
  }

  Future<User> createAccountWithGoogle() async {
    final cred = await signInWithGoogle();
    return cred.user!;
  }

  Future<String> getGoogleBirthday() async {
    final headers = await googleSignIn.currentUser!.authHeaders;
    final r = await Dio(
        BaseOptions(headers: {"Authorization": headers["Authorization"]})).get(
      "https://people.googleapis.com/v1/people/me?personFields=genders&key=",
    );
    final response = jsonDecode(r.data);
    return response["genders"][0]["formattedValue"];
  }
}
