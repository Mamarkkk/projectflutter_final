import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/services/database/database_service.dart';

// เก็บข้อมูลเกี่ยวกับ firebase

class AuthService {

  final _auth = FirebaseAuth.instance;

  User? getCurrentUser() => _auth.currentUser;
  String getCurrentUid() => _auth.currentUser!.uid;

  //login
  Future<UserCredential> loginEmailPassword(String email, password) async{
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    }

    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //register
  Future<UserCredential> registerEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    }

    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  //delete
  Future<void> deleteAccount() async {
    User? user = getCurrentUser();

    if (user != null){

      await DatabaseService().deleteUserInfoFromFirebase(user.uid);
      
      await user.delete();
    }

  }
  
}