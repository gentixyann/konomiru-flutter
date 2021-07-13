import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../providers/user_provider.dart';
import '../../widgets/mypage/mypage_view.dart';
import '../../widgets/mypage/mypage_movies/mypage_movies.dart';

class MyPageScreen extends StatelessWidget {
  static const routeName = '/mypage';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          // padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              MyPageView(),
              Padding(
                padding: EdgeInsets.only(
                  top: 3 * SizeConfig.blockSizeVertical,
                  bottom: 3 * SizeConfig.blockSizeVertical,
                ),
                child: Text(
                  'My Movies',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              MyPageMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
