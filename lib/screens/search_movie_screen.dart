import 'package:flutter/material.dart';

class SearchMovieScreen extends StatelessWidget {
  static const routeName = '/search-movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('検索'),
        ),
      ),
    );
  }
}
