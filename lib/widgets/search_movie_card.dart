import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../screens/search_movie_detail_screen.dart';

class SearchMovieCard extends StatelessWidget {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;
  final String backdropPath;

  SearchMovieCard(
    this.id,
    this.title,
    this.releaseDate,
    this.overview,
    this.posterPath,
    this.backdropPath,
  );

  void selectMovie(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(SearchMovieDetailScreen.routeName, arguments: {
      'id': id,
      'title': title,
      'releaseDate': releaseDate,
      'overview': overview,
      'posterPath': posterPath,
      'backdropPath': backdropPath,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMovie(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: <Widget>[
            if (posterPath != null)
              Image.network(
                'https://image.tmdb.org/t/p/w154/${posterPath}',
              ),
            if (posterPath == null)
              Container(
                width: 154,
                height: 230,
                child: Image.asset(
                  'assets/images/unnamed.png',
                  fit: BoxFit.contain,
                ),
              ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        releaseDate,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        overview,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Text(id.toString()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
