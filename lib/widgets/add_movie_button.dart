import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../widgets/common_UI/my_snackbar.dart';

class AddMovieButton extends StatelessWidget {
  final int movieId;
  final title;
  AddMovieButton(this.movieId, this.title);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  void _addMovie(BuildContext ctx) {
    final uid = auth.currentUser.uid;
    final _userRef = firestore.collection('users/${uid}/movies');
    _userRef.doc(movieId.toString()).snapshots().listen((snapshot) {
      if (!snapshot.exists) {
        //登録されてない新しいドキュメント
        _userRef
            .doc(movieId.toString())
            .set({'id': movieId, 'title': title})
            .then(
              (value) => MySnackBar.show(ctx, '追加しました！'),
            )
            .catchError((error) {
              MySnackBar.showError(ctx, 'エラー発生！追加に失敗。。。');
            });
      } else {
        MySnackBar.showError(ctx, '既に追加済みですよ！');
      }
    });

    print('追加' + movieId.toString());
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
