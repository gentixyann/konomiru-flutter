import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';

class MyPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Consumer<UserProvider>(builder: (context, model, child) {
      final userData = model.user;

      return userData == null
          ? Container(
              child: CircularProgressIndicator(),
            )
          : Row(
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
                        userData.displayName != null
                            ? userData.displayName
                            : 'No Name',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 1 * SizeConfig.blockSizeVertical,
                      ),
                      Text(userData.introText != null
                          ? userData.introText
                          : 'No introduction'),
                    ],
                  ),
                )
              ],
            );
    });
  }
}
