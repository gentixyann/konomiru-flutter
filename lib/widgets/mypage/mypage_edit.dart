import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';

class MyPageEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final userData = Provider.of<UserProvider>(context);
    final user = userData.userModels;
    return Container();
  }
}
