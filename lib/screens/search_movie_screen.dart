import 'package:flutter/material.dart';

class SearchMovieScreen extends StatelessWidget {
  static const routeName = '/search-movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: <Widget>[
          TextField(
            onChanged: (text) {
              print(text);
            },
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'タイトルを入れてね'),
          )
        ],
      )),
    );
  }
}
