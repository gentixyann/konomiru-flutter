import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  UserModel user;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future fetchUserData() async {
    final userId = _firebaseAuth.currentUser.uid;
    final docs = await _firestore.doc('users/${userId}').get();
    // final userModels = UserModel(
    //   uid: userId,
    //   displayName: docs.data()['displayName'],
    //   email: docs.data()['email'],
    //   photoURL: docs.data()['photoUrl'],
    //   introText: docs.data()['introText'],
    // );
    this.user = UserModel(docs);
    notifyListeners();
  }

  Future updateUserData(UserModel editedUserData) async {
    final doc = _firestore.doc('users/${editedUserData.uid}');
    await doc.update({
      'displayName': editedUserData.displayName,
      'email': editedUserData.email,
      'photoURL': editedUserData.photoURL,
      'introText': editedUserData.introText,
    });
    notifyListeners();
  }

  Stream<UserModel> get userData {
    final userId = _firebaseAuth.currentUser.uid;
    var _user;
    _firestore
        .doc('users/${userId}')
        .snapshots()
        .map((event) => _user = UserModel(event));
    return _user;
  }
}
