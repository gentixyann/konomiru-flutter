import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mypage_movie_model.dart';

class MyPageMovieProvider with ChangeNotifier {
  MyPageMovieModel myPageMovie;
  final uid = FirebaseAuth.instance.currentUser.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future fetchMyMovies(String movieId) async {
    final docs = await _firestore.doc('users/${uid}/movies/${movieId}').get();
    this.myPageMovie = MyPageMovieModel(docs);
    notifyListeners();
  }

  Future editMyMovies(String movieId) async {
    final movieRef = _firestore.doc('users/${uid}/movies/${movieId}');
    await movieRef.update({
      'id': movieId,
      'point1': 'point1',
      'point2': 'point2',
      'point3': 'point3',
    });
  }
}
