import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class SearchMovie with ChangeNotifier {
  String text = '';

  List _movies = [];

  List get movies {
    return [..._movies];
  }

  search() async {
    if (this.text.isNotEmpty) {
      var searchUrl =
          '${MOVIE_DB_BASE_URL}/search/movie?api_key=${API_KEY}&language=en-US&query=load&page=1';

      try {
        final response = await http.get(searchUrl);
        final extractedData = json.decode(response.body)['results'];
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
}
