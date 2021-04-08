import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../widgets/movie_card.dart';
import 'dart:async';

class SearchMovieScreen2 extends StatelessWidget {
  static const routeName = '/search-movie';
  StreamController _streamController = StreamController();
  var extractedData = [];
  var keyword = '';

  searchMovie(String text) async {
    if (text.isNotEmpty) {
      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=ja-US&query=${text}&page=1';
      try {
        final response = await http.get(searchUrl);
        extractedData = json.decode(response.body)['results'];
        if (extractedData == null) {
          print('nothing to get');
          return;
        }

        _streamController.add(extractedData);
      } catch (error) {
        print(error);
        throw (error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (inputText) {
                searchMovie(inputText);
                keyword = inputText;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintText: 'タイトルを入れてね'),
            ),
            if (_streamController.stream != null)
              StreamBuilder(
                stream: _streamController.stream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error),
                    );
                  }
                  if (snapshot.hasData) {
                    return Expanded(
                      child: SizedBox(
                        height: 200,
                        child: ListView.builder(
                            itemCount: snapshot.data.length ?? 0,
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
                            }),
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            if (_streamController.stream == null)
              Center(
                child: Text('空っぽです'),
              )
          ],
        ),
      ),
    );
  }
}
