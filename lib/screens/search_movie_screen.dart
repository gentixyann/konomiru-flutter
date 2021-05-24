import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import '../widgets/search_movie_card.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/search_movie_model.dart';

class SearchMovieScreen extends StatelessWidget {
  static const routeName = '/search-movie';
  StreamController _streamController = BehaviorSubject();
  SearchMovieModel _searchedMovie;
  var extractedData = [];

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
                                    // nullの対策が必要
                                    SearchMovieCard(
                                      snapshot.data[index]['id'],
                                      snapshot.data[index]['title'] != null
                                          ? snapshot.data[index]['title']
                                          : 'No Title',
                                      snapshot.data[index]['release_date'] !=
                                              null
                                          ? snapshot.data[index]['release_date']
                                          : 'No Release Date',
                                      snapshot.data[index]['overview'] != null
                                          ? snapshot.data[index]['overview']
                                          : 'No Overview',
                                      snapshot.data[index]['poster_path'],
                                      snapshot.data[index]['backdrop_path'],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    );
                  }
                  return Center(child: Text('Googleよりは検索クオリティ低いですよ'));
                },
              ),
          ],
        ),
      ),
    );
  }
}
