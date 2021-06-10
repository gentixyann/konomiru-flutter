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
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.4)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                background: backdropPath != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w780/${backdropPath}',
                        fit: BoxFit.fitHeight,
                      )
                    : Container(
                        width: 780,
                        height: 450,
                        child: Image.asset(
                          'assets/images/unnamed.png',
                          fit: BoxFit.cover,
                        ),
                      )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                )
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
      floatingActionButton: AddMovieButton(id, title),
    );
  }
}
