import 'package:flutter/material.dart';
import '../../widgets/space_box.dart';

class MyPageMovieDetailScreen extends StatelessWidget {
  static const routeName = '/mypage-movie-detail';

  final _formKey = GlobalKey<FormState>();

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
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
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
              padding: const EdgeInsets.symmetric(vertical: 20),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '作品の見所',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextFormField(
                            key: ValueKey('point1'),
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(labelText: '見所1'),
                          )
                        ],
                      ))
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
