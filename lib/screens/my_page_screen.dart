import 'package:flutter/material.dart';

class MyPageScreen extends StatelessWidget {
  static const routeName = '/my-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('My Page'),
      // ),
      body: Center(
        child: Text('My Page'),
      ),
    );
  }
}
