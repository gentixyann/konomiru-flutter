import 'package:flutter/material.dart';

import '../widgets/movie_card.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            MovieCard(),
          ],
        ),
      ),
    );
  }
}
