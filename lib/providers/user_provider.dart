import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  String uid;
  UserModel _userInfo;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get dataPath => _firestore.collection('users/$uid');
  UserModel get userInfo => _userInfo;

  fetchUserData() async {
    final userId = _firebaseAuth.currentUser.uid;
    DocumentSnapshot snapshot = await _firestore.doc('users/${userId}').get();
    print(snapshot.data());
    return snapshot.data();
  }
}
