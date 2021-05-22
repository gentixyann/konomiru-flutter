import 'package:flutter/material.dart';
import '../../widgets/mypage/mypage_edit.dart';

class MyPageEditScreen extends StatelessWidget {
  static const routeName = '/mypage-edit';

  void _saveProfile(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Icon(Icons.check),
          const Text('Save'),
        ],
      ),
      duration: const Duration(milliseconds: 2000),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              MyPageEdit(),
            ],
          ),
        ),
      ),
    );
  }
}
