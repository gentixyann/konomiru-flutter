import 'package:flutter/material.dart';

class SearchMovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Title'),
              background: Image.network(
                'https://image.tmdb.org/t/p/w154/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg',
                fit: BoxFit.cover,
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
