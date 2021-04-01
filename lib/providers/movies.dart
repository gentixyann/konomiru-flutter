import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Movies {
  List _movies = [];

  Future feachMovies() async {
    var url;
    url =
        'https://api.themoviedb.org/3/movie/now_playing?api_key=a1a357b8cd4732e4d9c84ecc9a1d7406&language=en-US&page=1';
    final extractedData = json.decode(url.body['dates']);
    if (extractedData == null) {
      print('nothing');
      return;
    }
    _movies = extractedData;
    print(_movies);
    return extractedData;
  }
}
