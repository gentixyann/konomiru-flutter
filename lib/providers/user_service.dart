import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await _firebaseAuth.currentUser;
  }
}
