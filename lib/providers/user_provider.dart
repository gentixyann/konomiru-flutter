import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  // List<UserModel> _userModels = [];
  UserModel _userModels;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // CollectionReference get dataPath => _firestore.collection('users/$uid');
  // UserModel get userInfo => _userInfo;
  UserModel get userModels => _userModels;

  Future fetchUserData() async {
    final userId = _firebaseAuth.currentUser.uid;
    final docs = await _firestore.doc('users/${userId}').get();
    final userModels = UserModel(
      uid: userId,
      displayName: docs.data()['displayName'],
      email: docs.data()['email'],
      photoURL: docs.data()['photoUrl'],
      introText: docs.data()['introText'],
    );
    // final userModels = docs.docs.map((doc) => UserModel()).toList();
    _userModels = userModels;
    notifyListeners();
  }

  Future updateUserData(UserModel editedUserData) async {
    final userId = _firebaseAuth.currentUser.uid;
    await _firestore.doc('users/${userId}').update({});
  }
}
