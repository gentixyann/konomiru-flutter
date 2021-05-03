import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/config.dart';
import './movie.dart';

class SearchMovie with ChangeNotifier {
  String text = '';

  // List<Movie> _movies = [];
  List<Movie> _movies = [];

  List<Movie> get movies {
    // List<Movie> get movies {
    print(_movies);
    return [..._movies];
  }

  search() async {
    // var searchUrl =
    //     '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=${text}&page=1';

    var searchUrl =
        '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=${text}&page=1';
    try {
      final response = await http.get(searchUrl);
      final extractedData = json.decode(response.body)['results'];
      if (extractedData == null) {
        print('nothing to get');
        return;
      }
      _movies = List<Movie>.from(
          extractedData.map((movie) => Movie.fromJson(movie())));

      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  search2() async {
    if (this.text.isNotEmpty) {
      print('入力した文字 ' + text);
      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=${text}&page=1';
      // final List<Movie> extractedData = json.decode(response.body)['results'];
      final response = await http.get(searchUrl);
      final List<dynamic> extractedData = json.decode(response.body)['results'];

      _movies = List<Movie>.from(
          extractedData.map((movie) => Movie.fromJson(movie())));

      _movies = extractedData;
      // print(_movies);
      notifyListeners();
    }
  }
}
