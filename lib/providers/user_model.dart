import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String uid;

  getUid() {
    uid = _auth.currentUser.uid;
    return uid;
  }
}
