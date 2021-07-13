import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyPageMovieModel {
  MyPageMovieModel(DocumentSnapshot doc) {
    movieId = doc.id;
    title = doc.data()['title'];
    pointText1 = doc.data()['point1'];
    pointText2 = doc.data()['point2'];
    pointText3 = doc.data()['point3'];
  }
  String movieId;
  String title;
  String pointText1;
  String pointText2;
  String pointText3;
}
