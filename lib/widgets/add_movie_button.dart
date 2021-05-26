import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class AddMovieButton extends StatelessWidget {
  final int id;
  final title;
  AddMovieButton(this.id, this.title);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _addMovie(BuildContext ctx) {
    final User user = auth.currentUser;
    final uid = user.uid;
    firestore
        .collection('users/${uid}/movies')
        .add({
          'id': id,
          'title': title,
        })
        .then((value) => ScaffoldMessenger.of(ctx)
            .showSnackBar(SnackBar(content: Text('追加しました！'))))
        .catchError((error) {
          ScaffoldMessenger.of(ctx)
              .showSnackBar(SnackBar(content: Text('エラー発生！追加できなかった')));
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
                        _addMovie(context);
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
