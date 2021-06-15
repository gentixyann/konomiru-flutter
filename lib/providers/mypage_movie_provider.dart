import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mypage_movie_model.dart';

class MyPageMovieProvider with ChangeNotifier {
  MyPageMovieModel myPageMovie;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future fetchMyMovies(String movieId) async {
    final userId = _firebaseAuth.currentUser.uid;
    final docs =
        await _firestore.doc('users/${userId}/movies/${movieId}').get();
    this.myPageMovie = MyPageMovieModel(docs);
    notifyListeners();
  }
}
