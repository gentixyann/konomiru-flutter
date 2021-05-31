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

  void _addMovie(BuildContext ctx) async {
    final uid = auth.currentUser.uid;
    final _userRef = firestore.collection('users/${uid}/movies');
    final _movieRef =
        firestore.collection('users/${uid}/movies').doc(movieId.toString());
    await _movieRef.get().then((docSnapshot) => {
          if (docSnapshot.exists)
            {
              // 既に登録されているドキュメントの場合
              MySnackBar.showError(ctx, '既に追加済みですよ！'),
              print('追加していない')
            }
          else
            {
              // 登録されてない新しいドキュメントの場合
              _userRef
                  .doc(movieId.toString())
                  .set({'id': movieId, 'title': title})
                  .then(
                    (value) => MySnackBar.show(ctx, '追加しました！'),
                  )
                  .catchError((error) {
                    MySnackBar.showError(ctx, 'エラー発生！追加に失敗。。。');
                  }),
            }
        });
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
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
