import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/config.dart';

class MyPageMovieCard extends StatelessWidget {
  final int id;
  final String title;

  MyPageMovieCard(this.id, this.title);

  getMyMovie() async {
    final url =
        '${MOVIE_DB_BASE_URL}/movie/${id}?api_key=${API_KEY}&language=en-US';
    final response = await http.get(url);
    final extractedData = jsonDecode(response.body);
    return extractedData;
  }

  void _selectMovie() {
    print('tap!');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getMyMovie(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          if (snapshot.hasData) {
            final posterPath = snapshot.data['poster_path'];
            final backdropPath = snapshot.data['backdrop_path'];
            return InkWell(
              onTap: _selectMovie,
              splashColor: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Row(
                  children: <Widget>[
                    posterPath != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w154/${posterPath}',
                          )
                        : Container(
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
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
