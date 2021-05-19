import 'package:flutter/material.dart';

class MyPageEditScreen extends StatelessWidget {
  static const routeName = '/mypage-edit';

  void _saveProfile(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: const Text('save'),
      duration: const Duration(milliseconds: 2000),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check_sharp),
            onPressed: () {
              _saveProfile(context);
            },
          )
        ],
      ),
      body: Container(),
    );
  }
}
