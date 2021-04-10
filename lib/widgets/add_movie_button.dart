import 'package:flutter/material.dart';

class AddMovieButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        print('追加');
      },
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
