import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FirebaseAuthServices {
  static Future<User?> signInUsingEmailAndPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (kDebugMode) {
          print('No user found for that email.');
        }
        return null;
      } else if (e.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
        return null;
      }
      return null;
    }
  }

  static FutureOr<User?> createNewUserAccount(
      {required firstName,
      required lastName,
      required String email,
      required String phoneNumber,
      required bool isDriver,
      required String password,
      required navigator,
      required BuildContext context}) async {
    Box box = Hive.box('migrant');
    FirebaseAuth auth = FirebaseAuth.instance;
    final userInfo = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'isDriver': isDriver,
    };
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
      if (user != null) {
        // Add user details to firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .set(userInfo);
        box.put('user', userInfo);
        navigator;
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (kDebugMode) {
          print('The password provided is too weak.');
        }
        return null;
      } else if (e.code == 'email-already-in-use') {
        if (kDebugMode) {
          print('The account already exists for that email.');
        }
        return null;
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
    return null;
  }

  static Future<DocumentSnapshot> getUserData(
      {required String uid, required BuildContext context}) async {
    DocumentSnapshot user =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    Box box = Hive.box('migrant');
    box.put('user', user.data());
    return user;
  }
}
