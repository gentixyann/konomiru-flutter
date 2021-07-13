import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_UI/space_box.dart';
import '../../../providers/mypage_movie_provider.dart';

class MyPageMovieForm extends StatelessWidget {
  final int id;
  MyPageMovieForm(this.id);

  final formKey = GlobalKey<FormState>();
  final text1EditingController = TextEditingController();
  final text2EditingController = TextEditingController();
  final text3EditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MyPageMovieProvider>(builder: (context, model, child) {
      model.fetchMyMovies(id);
      // model.fetchMyMoviesStream(id);
      final movie = model.myPageMovie;

      if (movie.point1Text != '') {
        text1EditingController.text = movie.point1Text;
      }
      if (movie.point2Text != '') {
        text2EditingController.text = movie.point2Text;
      }
      if (movie.point3Text != '') {
        text3EditingController.text = movie.point3Text;
      }

      return movie == null
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: ListView(
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            shape: BoxShape.circle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('1'),
                          ],
                        ),
                      ),
                      SpaceBox.width(10),
                      Expanded(
                        child: TextFormField(
                          // controller: text1EditingController,
                          decoration: InputDecoration(labelText: '見所1'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            model.point1Text = value;
                            print(model.point1Text);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            shape: BoxShape.circle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('2'),
                          ],
                        ),
                      ),
                      SpaceBox.width(10),
                      Expanded(
                        child: TextFormField(
                          controller: text2EditingController,
                          decoration: InputDecoration(labelText: '見所2'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            model.point2Text = value;
                            print(model.point2Text);
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            shape: BoxShape.circle),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('3'),
                          ],
                        ),
                      ),
                      SpaceBox.width(10),
                      Expanded(
                        child: TextFormField(
                          controller: text3EditingController,
                          decoration: InputDecoration(labelText: '見所3'),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textInputAction: TextInputAction.newline,
                          onChanged: (value) {
                            model.point3Text = value;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<MyPageMovieProvider>.value(
  //     value: MyPageMovieProvider()..fetchMyMovies(id),
  //     child: Consumer<MyPageMovieProvider>(
  //       builder: (context, model, child) {
  //         final movie = model.myPageMovie;

  //         // model.fetchMyMoviesStream(id);
  //         return movie == null
  //             ? Center(child: CircularProgressIndicator())
  //             : Form(
  //                 key: formKey,
  //                 child: ListView(
  //                   padding: EdgeInsets.only(top: 10),
  //                   shrinkWrap: true,
  //                   children: <Widget>[
  //                     Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: <Widget>[
  //                         Container(
  //                           width: 50,
  //                           height: 50,
  //                           decoration: BoxDecoration(
  //                               border: Border.all(
  //                                 width: 1,
  //                                 color: Colors.grey,
  //                               ),
  //                               shape: BoxShape.circle),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               Text('1'),
  //                             ],
  //                           ),
  //                         ),
  //                         SpaceBox.width(10),
  //                         Expanded(
  //                           child: TextFormField(
  // controller: TextEditingController(
  //   text: movie.pointText1 != null
  //       ? movie.pointText1
  //       : '',
  // ),
  //                             decoration: InputDecoration(labelText: '見所1'),
  //                             keyboardType: TextInputType.multiline,
  //                             maxLines: null,
  //                             textInputAction: TextInputAction.newline,
  //                             onChanged: (value) {
  //                               model.point1Text = value;
  //                               print(model.point1Text);
  //                             },
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               );
  //       },
  //     ),
  //   );
  // }
}
