import 'package:alora/src/services/auth/auth_with_google.dart';
import 'package:alora/src/services/auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthRiverpod = Provider<FirebaseAuthentication>((ref) {
  return FirebaseAuthentication(ref, FirebaseAuth.instance);
});
final googleAuthRiverpod = Provider<AuthWithGoogle>((ref) {
  return AuthWithGoogle(ref, FirebaseAuth.instance);
});
final authStateRiverpod = StreamProvider<User?>((ref) async* {
  yield* ref.watch(firebaseAuthRiverpod).getAuthUser;
});

final googleSignInRiverpod = FutureProvider<UserCredential>((
  ref,
) async {
  return ref.read(googleAuthRiverpod).signInWithGoogle();
});
final emailSignInRiverpod =
    FutureProvider.family<UserCredential?, List<String>>((ref, data) async {
  return ref
      .read(firebaseAuthRiverpod)
      .signupUser(mail: data.first, pass: data.last, name: data.last);
});

final googleSignUpRiverpod = FutureProvider<User>((
  ref,
) async {
  return ref.read(googleAuthRiverpod).createAccountWithGoogle();
});
