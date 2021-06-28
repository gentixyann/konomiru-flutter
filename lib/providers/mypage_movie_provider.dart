import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mypage_movie_model.dart';

class MyPageMovieProvider with ChangeNotifier {
  MyPageMovieModel myPageMovie;
  String point1Text = '';
  String point2Text = '';
  String point3Text = '';
  final uid = FirebaseAuth.instance.currentUser.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future fetchMyMovies(String movieId) async {
    final docs = await _firestore.doc('users/${uid}/movies/${movieId}').get();
    this.myPageMovie = MyPageMovieModel(docs);
    notifyListeners();
  }

  void fetchMyMoviesStream(String movieId) {
    final snapshots =
        _firestore.doc('users/${uid}/movies/${movieId}').snapshots();
    snapshots.listen((snapshot) {
      this.myPageMovie = MyPageMovieModel(snapshot);
      notifyListeners();
    });
  }

  Future editMyMovies(String movieId) async {
    final movieRef = _firestore.doc('users/${uid}/movies/${movieId}');
    await movieRef.update({
      'id': int.parse(movieId),
      'point1': point1Text,
      'point2': point2Text,
      'point3': point3Text,
    });
  }

  void reload() {
    notifyListeners();
  }
}
