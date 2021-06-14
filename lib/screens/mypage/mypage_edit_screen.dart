import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_model.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';
import '../../widgets/common_UI/my_snackbar.dart';

class MyPageEditScreen extends StatelessWidget {
  MyPageEditScreen({this.user});
  final UserModel user;
  String _displayName;
  String _email;
  String _photoURL;
  String _introText;
  final _form = GlobalKey<FormState>();

  Future _saveProfile(UserProvider model, BuildContext ctx) async {
    _form.currentState.save();
    user.displayName = _displayName;
    user.email = _email;
    user.photoURL = _photoURL;
    user.introText = _introText;

    await model.updateUserData(user);
    MySnackBar.show(ctx, 'Save');
  }
  // _saveForm() {
  //   _form.currentState.save();
  //   final userData =
  //       Provider.of<UserProvider>(context, listen: false).userModels;
  //   _editedUserData = UserModel(
  //     displayName: _editedUserData.displayName,
  //     email: userData.email,
  //     photoURL: userData.photoURL,
  //     introText: _editedUserData.introText,
  //   );
  //   Provider.of<UserProvider>(context, listen: false)
  //       .updateUserData(_editedUserData);
  // }

  // void _saveProfile(BuildContext ctx) {
  //   _saveForm();
  //   ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
  //     content: Row(
  //       children: <Widget>[
  //         Icon(Icons.check),
  //         const Text('Save'),
  //       ],
  //     ),
  //     duration: const Duration(milliseconds: 3000),
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 8.0, // Inner padding for SnackBar content.
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(15),
  //     ),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    final nameEditingController = TextEditingController();
    final introEditingController = TextEditingController();
    nameEditingController.text = user.displayName;
    introEditingController.text = user.introText;
    _email = user.email;
    _photoURL = user.photoURL;
    return Consumer<UserProvider>(builder: (context, model, child) {
      final userData = user;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Edit Profile'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check_sharp),
              onPressed: () {
                _saveProfile(model, context);
              },
            )
          ],
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            child: Column(
              children: <Widget>[
                userData == null
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
                                    controller: nameEditingController,
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
                                    controller: introEditingController,
                                    textInputAction: TextInputAction.newline,
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
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
