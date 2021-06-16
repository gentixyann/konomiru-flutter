import 'package:flutter/material.dart';
import '../widgets/common_UI/space_box.dart';

class MyPageMovieForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _point1Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                  controller: _point1Controller,
                  decoration: InputDecoration(labelText: '見所1'),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
