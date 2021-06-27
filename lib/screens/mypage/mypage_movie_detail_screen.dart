import 'package:flutter/material.dart';
import '../../widgets/common_UI/space_box.dart';
import '../../config/size_config.dart';
import '../../widgets/mypage/mypage_movie_form.dart';
import '../../widgets/mypage/save_movie_text.dart';

class MyPageMovieDetailScreen extends StatelessWidget {
  static const routeName = '/mypage-movie-detail';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final selectedMovie = routeArgs;
    final id = selectedMovie['id'];
    final title = selectedMovie['title'];
    final backdropPath = selectedMovie['backdropPath'];
    final posterPath = selectedMovie['posterPath'];
    final _point1Controller = TextEditingController();

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
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3 * SizeConfig.blockSizeVertical,
                  horizontal: 3 * SizeConfig.blockSizeVertical,
                ),
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
                              ),
                      ],
                    ),
                    SpaceBox.height(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          child: Text(
                            '作品の見所',
                            style: Theme.of(context).textTheme.headline5,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    MyPageMovieForm(),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
      floatingActionButton: SaveMovieText(),
    );
  }
}
