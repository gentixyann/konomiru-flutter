import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/mypage_movie_model.dart';

class MyPageMovieProvider with ChangeNotifier {
  MyPageMovieModel myPageMovie;
  String point1 = '';
  String point2 = '';
  String point3 = '';
  final uid = FirebaseAuth.instance.currentUser.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future fetchMyMovies(int movieId) async {
    final docs =
        await _firestore.doc('users/${uid}/movies/${movieId.toString()}').get();
    this.myPageMovie = MyPageMovieModel(docs);

    this.point1Text = docs.data()['point1'];
    this.point2Text = docs.data()['point2'];
    this.point3Text = docs.data()['point3'];
    notifyListeners();
  }

  void fetchMyMoviesStream(int movieId) {
    final snapshots =
        _firestore.doc('users/${uid}/movies/${movieId.toString()}').snapshots();
    snapshots.listen((snapshot) {
      this.myPageMovie = MyPageMovieModel(snapshot);
      notifyListeners();
    });
  }

  Future editMyMovies(int movieId, String title) async {
    final movieRef =
        _firestore.doc('users/${uid}/movies/${movieId.toString()}');
    await movieRef.update({
      'id': movieId,
      'title': title,
      'point1': point1,
      'point2': point2,
      'point3': point3,
    });
  }

  void reload() {
    notifyListeners();
  }
}
