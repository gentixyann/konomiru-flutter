import 'package:flutter/material.dart';

class SearchMovieDetailScreen extends StatelessWidget {
  static const routeName = '/search-movie-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMovie = routeArgs;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedMovie['title']),
              background: Image.network(
                'https://image.tmdb.org/t/p/w780/5NxjLfs7Bi07bfZCRl9CCnUw7AA.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('releaseDate'),
                      ),
                      Container(
                        child: Text('overview'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
