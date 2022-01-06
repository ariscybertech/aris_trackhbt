import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:tack_habit/models/appUser.dart';

class FireAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user status
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
  // Convert firebase user to the AppUser

  AppUser _userFromFirebaseUser(User user) {
    if (user == null) {
      return null;
    }
    return AppUser(
      id: user.uid,
      email: user.email,
      name: user.displayName,
    );
  }

  // sign in with email

  Future<AppUser> signInWithEmailPassword(
      {String email, String password}) async {
    final result = await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((error) {
      debugPrint("returning null");
      throw Exception();
    });
    return _userFromFirebaseUser(result.user);
  }

  // sign in with google

  // sign up with email
  Future<AppUser> signUpWithEmailPassword(
      {String name, String email, String password}) async {
    UserCredential toReturn;
    try {
      toReturn = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      debugPrint("error found while signing up new user.\t\t  ${e.toString()}");
      throw Exception();
    }
    return _userFromFirebaseUser(toReturn.user);
  }

  // forgot password
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // log out user

  void logOutUser() {
    _auth.signOut();
  }
}
