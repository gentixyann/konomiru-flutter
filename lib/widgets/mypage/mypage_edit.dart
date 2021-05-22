import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';
import '../../models/user_model.dart';

class MyPageEdit extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  var _editedUserData = UserModel(
    displayName: '',
    introText: '',
  );

  _saveForm(BuildContext context) {
    _form.currentState.save();
    Provider.of<UserProvider>(context).updateUserData(_editedUserData);
    print(_editedUserData.displayName);
    print(_editedUserData.introText);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<UserProvider>(builder: (context, model, child) {
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
                          style: Theme.of(context).textTheme.headline6,
                          textInputAction: TextInputAction.done,
                          onSaved: (value) {
                            _editedUserData = UserModel(
                              displayName: value,
                            );
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
                            _editedUserData = UserModel(
                              introText: value,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: TextButton(
                      child: Text('save'),
                      onPressed: _saveForm(context),
                    ),
                  )
                ],
              ),
            );
    });
  }
}
