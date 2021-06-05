import 'package:flutter/material.dart';
import '../../config/config.dart';

class MyPageMovieCard extends StatelessWidget {
  final int id;
  final String title;

  MyPageMovieCard(this.id, this.title);

  void _selectMovie() {
    print('tap!');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectMovie,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: <Widget>[
            Text(id.toString()),
          ],
        ),
      ),
    );
  }
}
