import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;

  MovieCard(this.title, this.releaseDate, this.overview, this.posterPath);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          if (posterPath != null)
            Image.network(
              'https://image.tmdb.org/t/p/w154/${posterPath}',
            ),
          if (posterPath == null)
            Image.network(
              'https://image.tmdb.org/t/p/w154/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
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
                    // height: 50,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 15),
                    // height: 20,
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
                    // height: 60,
                    child: Text(
                      overview,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
