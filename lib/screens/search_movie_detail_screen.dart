import 'package:flutter/material.dart';
import '../widgets/add_movie_button.dart';
import '../widgets/space_box.dart';

class SearchMovieDetailScreen extends StatelessWidget {
  static const routeName = '/search-movie-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMovie = routeArgs;
    final id = selectedMovie['id'];
    final title = selectedMovie['title'];
    final backdropPath = selectedMovie['backdropPath'];
    final posterPath = selectedMovie['posterPath'];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          if (backdropPath != null)
            buildSliverAppBar(context, title, backdropPath),
          if (backdropPath == null)
            buildSliverAppBar(
                context, title, 'inJjDhCjfhh3RtrJWBmmDqeuSYC.jpg'),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            'https://image.tmdb.org/t/p/w154/${posterPath}',
                          ),
                        ],
                      ),
                      SpaceBox.height(20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                              'Release Date',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Text(selectedMovie['releaseDate']),
                          SpaceBox.height(20),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            child: Text(
                              'Overview',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Text(selectedMovie['overview']),
                          Container(
                            child: Text(selectedMovie['id'].toString()),
                          ),
                          SpaceBox.height(40),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AddMovieButton(id),
    );
  }
}

Widget buildSliverAppBar(
  BuildContext context,
  String movieTitle,
  String backdropPathUrl,
) {
  return SliverAppBar(
    expandedHeight: 250,
    flexibleSpace: FlexibleSpaceBar(
      title: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Text(
          movieTitle,
        ),
      ),
      background: Image.network(
        'https://image.tmdb.org/t/p/w780/${backdropPathUrl}',
        fit: BoxFit.fitHeight,
      ),
    ),
  );
}
