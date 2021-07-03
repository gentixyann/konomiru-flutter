import 'package:cloud_firestore/cloud_firestore.dart';

class MyPageMovieModel {
  MyPageMovieModel(DocumentSnapshot doc) {
    movieId = doc.id;
    title = doc.data()['title'];
    point1 = doc.data()['point1'];
    point2 = doc.data()['point2'];
    point3 = doc.data()['point3'];
  }
  String movieId;
  String title;
  String point1;
  String point2;
  String point3;
}
