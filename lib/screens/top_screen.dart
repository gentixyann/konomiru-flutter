import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/movie_card.dart';

class TopScreen extends StatelessWidget {
  getMovies() async {
    var url;
    url = await http.get(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a1a357b8cd4732e4d9c84ecc9a1d7406&language=en-US&page=1');
    final extractedData = json.decode(url.body)['results'];
    if (extractedData == null) {
      print('nothing');
      return;
    }
    print(extractedData);
    return extractedData;
  }

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
            ElevatedButton(
              child: Text('テスト'),
              onPressed: getMovies,
            ),
          ],
        ),
      ),
    );
  }
}
