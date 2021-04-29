import 'package:flutter/material.dart';
import '../widgets/add_movie_button.dart';

class SearchMovieDetailScreen extends StatelessWidget {
  static const routeName = '/search-movie-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMovie = routeArgs;
    final backdropPath = selectedMovie['backdropPath'];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          if (backdropPath != null)
            SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.4)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Text(
                    selectedMovie['title'],
                  ),
                ),
                background: Image.network(
                  'https://image.tmdb.org/t/p/w780/${backdropPath}',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          if (backdropPath == null)
            SliverAppBar(
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(selectedMovie['title']),
                background: Image.network(
                  'https://image.tmdb.org/t/p/w780/inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg',
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
                        child: Text(selectedMovie['releaseDate']),
                      ),
                      Container(
                        child: Text(selectedMovie['overview']),
                      ),
                      Container(
                        child: Text(selectedMovie['id'].toString()),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AddMovieButton(),
    );
  }
}
