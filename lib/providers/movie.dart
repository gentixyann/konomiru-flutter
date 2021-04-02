import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final String movieId;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;

  Movie({
    @required this.movieId,
    @required this.title,
    @required this.releaseDate,
    @required this.overview,
    @required this.posterPath,
  });
}
