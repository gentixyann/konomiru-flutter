import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
import './movie.dart';
import 'dart:math' as Math;

class SearchMovie with ChangeNotifier {
  String text = '';

  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  search() async {
    if (this.text.isNotEmpty) {
      // var searchUrl =
      //     '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=${text}&page=1';

      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=big&page=1';
      try {
        final response = await http.get(searchUrl);
        final List<Movie> extractedData = json.decode(response.body)['results'];
        if (extractedData == null) {
          print('nothing to get');
          return;
        }

        _movies = extractedData;
        notifyListeners();
      } catch (error) {
        print(error);
        throw (error);
      }
    }
  }

  search2() async {
    if (this.text.isNotEmpty) {
      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=${text}&page=1';
      // final List<Movie> extractedData = json.decode(response.body)['results'];
      // _movies = jsonRes;
      final response = await http.get(searchUrl);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print(searchUrl);
      notifyListeners();
    }
  }
}
