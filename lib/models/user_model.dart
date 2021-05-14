import 'package:flutter/material.dart';

class UserModel {
  String uid;
  String email;
  String displayName;
  String photoUrl;
  String introText;

  UserModel({
    this.uid,
    this.email,
    this.displayName,
    this.photoUrl,
    this.introText,
  });
}
