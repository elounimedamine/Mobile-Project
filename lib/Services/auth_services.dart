import 'dart:developer';

import 'package:application_from_scratch_flutter_9antra_the_bridge/model/end_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  EndUser _userFirebaseUser(User? firebaseUser) {
    return EndUser(uid: firebaseUser!.uid);
  }

  // Future registerUser(EndUser newUser, String password) async {
  //   try {
  //     UserCredential endUserCredentials =
  //         await _firebaseAuth.createUserWithEmailAndPassword(
  //             email: newUser.email!, password: password);
  //     User firebaseUser = endUserCredentials.user!;
  //     addUserToCollection(newUser, firebaseUser.uid);
  //     return _userFirebaseUser(firebaseUser);
  //   } catch (err, stacktrace) {
  //     log('user signup failed :: $err');
  //     log('user signup failed :: $stacktrace');
  //     return null;
  //   }
  // }

  Future registerWithEmailPassword(
      String name, String email, String password) async {
    try {
      var res = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      print(res);
      res.user?.updateDisplayName(name);
      return {"status": true, "message": "success", "data": res.user};
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return {"status": false, "message": e.message.toString(), "data": ""};
    }
  }

  Future loginUser(String email, String password) async {
    try {
      UserCredential endUserCredentials = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User firebaseUser = endUserCredentials.user!;
      return _userFirebaseUser(firebaseUser);
    } catch (err, stacktrace) {
      log('user login failed :: $err');
      log('user login failed :: $stacktrace');
      return null;
    }
  }

  Future logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (err, stacktrace) {
      log('user login failed :: $err');
      log('user login failed :: $stacktrace');
      return null;
    }
  }

  Future addUserToCollection(EndUser newUser, String? uid) async {
    await _firebaseFirestore.collection('users').doc(uid).set(newUser.toJson());
  }

  Future<DocumentSnapshot> getUserData(String userID) async {
    return _firebaseFirestore.collection('users').doc(userID).get();
  }
}
