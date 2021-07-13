import 'package:cloud_firestore/cloud_firestore.dart';

class MyPageMovieModel {
  MyPageMovieModel(DocumentSnapshot doc) {
    movieId = doc.id;
    title = doc.data()['title'];
    point1Text = doc.data()['point1'];
    point2Text = doc.data()['point2'];
    point3Text = doc.data()['point3'];
  }
  String movieId;
  String title;
  String point1Text;
  String point2Text;
  String point3Text;
}
