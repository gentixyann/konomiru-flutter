import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../widgets/movie_card.dart';
import '../config.dart';

class TopScreen extends StatelessWidget {
  static const routeName = '/top';

  getMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=${API_KEY}&language=en-US&page=1';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body)['results'];
      if (extractedData == null) {
        print('nothing to get');
        return;
      }
      return extractedData;
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        MovieCard(
                          snapshot.data[index]['title'],
                          snapshot.data[index]['release_date'],
                          snapshot.data[index]['overview'],
                          snapshot.data[index]['poster_path'],
                        ),
                      ],
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
