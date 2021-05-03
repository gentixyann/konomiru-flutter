import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMovieButton extends StatelessWidget {
  final int id;
  AddMovieButton(this.id);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _addMovie() {
    firestore.collection('users/testUser/movies').add({
      'id': id,
    });
    print('追加' + id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  title: Text('追加しますか？'),
                  actions: <Widget>[
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        _addMovie();
                        Navigator.of(ctx).pop(true);
                      },
                    )
                  ],
                ));
      },
      child: const Icon(Icons.add),
      backgroundColor: Theme.of(context).accentColor,
    );
  }
}
