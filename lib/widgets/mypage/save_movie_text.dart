import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mypage_movies/mypage_movie_form.dart';
import '../../providers/mypage_movie_provider.dart';

class SaveMovieText extends StatelessWidget {
  final int id;
  final String title;
  SaveMovieText(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPageMovieProvider>(builder: (context, model, child) {
      return FloatingActionButton(
        onPressed: () async {
          print('保存' + id.toString());
<<<<<<< HEAD
          // await model.editMyMovies(id, title);
          print(model.point1Text);
          print(model.point2Text);
          print(model.point3Text);
=======
          await model.editMyMovies(id, title);
          print(model.point1);
          print(model.point2);
          print(model.point3);
>>>>>>> 4e2780bd1e5e7aa1ceab574a66f9d98a4e4bcc2e
        },
        child: const Icon(Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
      );
    });
  }
}
