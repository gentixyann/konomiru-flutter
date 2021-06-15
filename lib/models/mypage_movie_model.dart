import 'package:cloud_firestore/cloud_firestore.dart';

class MyPageMovieModel {
  MyPageMovieModel(DocumentSnapshot doc) {
    movieId = doc.id;
    title = doc.data()['title'];
    pointText1 = doc.data()['pointText1'];
    pointText2 = doc.data()['pointText2'];
    pointText3 = doc.data()['pointText3'];
  }
  String movieId;
  String title;
  String pointText1;
  String pointText2;
  String pointText3;
}
