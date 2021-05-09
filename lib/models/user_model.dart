import 'package:flutter/material.dart';

class UserData {
  final String uid;
  String email;
  String name;
  String photoUrl;
  String text;

  UserData({
    @required this.uid,
    @required this.email,
  });
}
