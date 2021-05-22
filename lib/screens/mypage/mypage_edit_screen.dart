import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';

class MyPageEditScreen extends StatefulWidget {
  static const routeName = '/mypage-edit';

  @override
  _MyPageEditScreenState createState() => _MyPageEditScreenState();
}

final _form = GlobalKey<FormState>();
String _displayName;
String _introText;

var _editedUserData = UserModel(
  displayName: '',
  introText: '',
);

class _MyPageEditScreenState extends State<MyPageEditScreen> {
  _saveForm(BuildContext context) {
    _form.currentState.save();
    // Provider.of<UserProvider>(context).updateUserData(_editedUserData);
    // print(_editedUserData.displayName);
    // print(_editedUserData.introText);
    print(_displayName);
    print(_introText);
  }

  void _saveProfile(BuildContext ctx) {
    _saveForm(ctx);
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Icon(Icons.check),
          const Text('Save'),
        ],
      ),
      duration: const Duration(milliseconds: 3000),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0, // Inner padding for SnackBar content.
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // final userData = Provider.of<UserProvider>(context).userModels;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check_sharp),
            onPressed: () {
              _saveProfile(context);
            },
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: <Widget>[
              Consumer<UserProvider>(builder: (context, model, child) {
                final userData = model.userModels;
                return userData == null
                    ? Container(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: _form,
                        child: Row(
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
                                  TextFormField(
                                    initialValue: userData.displayName,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    textInputAction: TextInputAction.done,
                                    onSaved: (value) {
                                      _displayName = value;
                                    },
                                  ),
                                  SizedBox(
                                    height: 1 * SizeConfig.blockSizeVertical,
                                  ),
                                  TextFormField(
                                    initialValue: userData.introText,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    onSaved: (value) {
                                      _introText = value;
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
