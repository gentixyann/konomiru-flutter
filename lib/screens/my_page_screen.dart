import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/user_provider.dart';

class MyPageScreen extends StatelessWidget {
  static const routeName = '/my-page';

  fetchUserData() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final userId = _firebaseAuth.currentUser.uid;
    DocumentSnapshot snapshot = await _firestore.doc('users/${userId}').get();
    print(snapshot.data()['email']);
    return snapshot.data();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              Consumer<UserProvider>(
                builder: (context, model, child) {
                  final userData = model.userModels;
                  return Row(
                    children: <Widget>[
                      Container(
                        height: 10 * SizeConfig.blockSizeVertical,
                        width: 20 * SizeConfig.blockSizeHorizontal,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://lh5.googleusercontent.com/-rEw1ckfg8Sc/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuckW028Ka5poorv9UE629d5mtR13CA/s96-c/photo.jpg'),
                            )),
                      ),
                      SizedBox(
                        width: 5 * SizeConfig.blockSizeHorizontal,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userData.displayName,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            SizedBox(
                              height: 1 * SizeConfig.blockSizeVertical,
                            ),
                            Text(userData.introText),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              Row(
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              top: 3 * SizeConfig.blockSizeVertical),
                          child: Text(
                            'My Movies',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        TextButton(
                            onPressed: fetchUserData, child: Text('テスト')),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
