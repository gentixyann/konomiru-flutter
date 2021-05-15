import 'package:flutter/material.dart';

class UserModel {
  String uid;
  String email;
  String displayName;
  String photoURL;
  String introText;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
    this.photoURL,
    this.introText,
  });
}
