import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../config.dart';
import '../widgets/movie_card.dart';
import '../providers/search_movie.dart';
import '../providers/movie.dart';

class SearchMovieScreen extends StatelessWidget {
  static const routeName = '/search-movie';

  searchMovie(String text) async {
    if (text.isNotEmpty) {
      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=load&page=1';

      try {
        final response = await http.get(searchUrl);
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
  }

  @override
  Widget build(BuildContext context) {
    final moviesData = Provider.of<SearchMovie>(context);
    final searchedMovies = moviesData.movies;

    return ChangeNotifierProvider<SearchMovie>(
      create: (_) => SearchMovie(),
      child: Consumer<SearchMovie>(
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
                child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (inputText) {
                    print(inputText);
                    model.text = inputText;
                    model.search2();
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      hintText: 'タイトルを入れてね'),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: model.movies.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: <Widget>[
                              // if (model.text.isNotEmpty)
                              MovieCard(
                                searchedMovies[index].title,
                                searchedMovies[index].releaseDate,
                                searchedMovies[index].overview,
                                searchedMovies[index].posterPath,
                              ),
                              // if (model.text == null)
                              //   Center(
                              //     child: Text('enter movie title'),
                              //   ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
