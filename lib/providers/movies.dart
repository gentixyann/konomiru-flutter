import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../providers/movie.dart';

class Movies with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies {
    return [..._movies];
  }

  Future<void> feachMovies() async {
    final url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a1a357b8cd4732e4d9c84ecc9a1d7406&language=en-US&page=1';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body)['dates'];
      if (extractedData == null) {
        print('nothing to get');
        return;
      }
      _movies = extractedData;
      print(_movies);
      notifyListeners();
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
