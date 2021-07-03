import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_UI/space_box.dart';
import '../../providers/mypage_movie_provider.dart';

class MyPageMovieForm extends StatelessWidget {
  final int id;
  MyPageMovieForm(this.id);
  final formKey = GlobalKey<FormState>();
  final _point1Controller = TextEditingController();
  final _point2Controller = TextEditingController();
  final _point3Controller = TextEditingController();

  // @override
  // Widget build(BuildContext context) {
  //   return Consumer<MyPageMovieProvider>(builder: (context, model, child) {
  //     return Form(
  //       key: formKey,
  //       child: ListView(
  //         padding: EdgeInsets.only(top: 10),
  //         shrinkWrap: true,
  //         // physics: NeverScrollableScrollPhysics(),
  //         children: <Widget>[
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 width: 50,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       width: 1,
  //                       color: Colors.grey,
  //                     ),
  //                     shape: BoxShape.circle),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text('1'),
  //                   ],
  //                 ),
  //               ),
  //               SpaceBox.width(10),
  //               Expanded(
  //                 child: TextFormField(
  //                   controller: _point1Controller,
  //                   decoration: InputDecoration(labelText: '見所1'),
  //                   keyboardType: TextInputType.multiline,
  //                   maxLines: null,
  //                   textInputAction: TextInputAction.newline,
  //                   onChanged: (value) {
  //                     model.point1Text = value;
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 width: 50,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       width: 1,
  //                       color: Colors.grey,
  //                     ),
  //                     shape: BoxShape.circle),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text('2'),
  //                   ],
  //                 ),
  //               ),
  //               SpaceBox.width(10),
  //               Expanded(
  //                 child: TextFormField(
  //                   controller: _point2Controller,
  //                   decoration: InputDecoration(labelText: '見所2'),
  //                   keyboardType: TextInputType.multiline,
  //                   maxLines: null,
  //                   textInputAction: TextInputAction.newline,
  //                   onChanged: (value) {
  //                     model.point2Text = value;
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Container(
  //                 width: 50,
  //                 height: 50,
  //                 decoration: BoxDecoration(
  //                     border: Border.all(
  //                       width: 1,
  //                       color: Colors.grey,
  //                     ),
  //                     shape: BoxShape.circle),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text('3'),
  //                   ],
  //                 ),
  //               ),
  //               SpaceBox.width(10),
  //               Expanded(
  //                 child: TextFormField(
  //                   controller: _point3Controller,
  //                   decoration: InputDecoration(labelText: '見所3'),
  //                   keyboardType: TextInputType.multiline,
  //                   maxLines: null,
  //                   textInputAction: TextInputAction.newline,
  //                   onChanged: (value) {
  //                     model.point3Text = value;
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyPageMovieProvider>(
      create: (_) => MyPageMovieProvider()..fetchMyMoviesStream(id),
      child: Consumer<MyPageMovieProvider>(
        builder: (context, model, child) {
          final movie = model.myPageMovie;
          return Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.only(top: 10),
              shrinkWrap: true,
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
                        controller: TextEditingController(text: movie.point1),
                        decoration: InputDecoration(labelText: '見所1'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onChanged: (value) {
                          model.point1Text = value;
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
                        controller: _point2Controller,
                        decoration: InputDecoration(labelText: '見所2'),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onChanged: (value) {
                          model.point2Text = value;
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
                        controller: _point3Controller,
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
        },
      ),
    );
  }
}
