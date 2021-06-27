import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mypage_movie_form.dart';
import '../../providers/mypage_movie_provider.dart';

class SaveMovieText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyPageMovieProvider>(builder: (context, model, child) {
      return FloatingActionButton(
        onPressed: () {
          print('保存');
          print(model.point1Text);
          print(model.point2Text);
          print(model.point3Text);
        },
        child: const Icon(Icons.save),
        backgroundColor: Theme.of(context).primaryColor,
      );
    });
  }
}
