import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String message;
  MySnackBar({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  static show(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(message),
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

  static showError(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(message),
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

  // @override
  // Widget build(BuildContext context) {
  //   return SnackBar(
  //     content: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Icon(
  //           Icons.check,
  //           color: Colors.white,
  //         ),
  //         SizedBox(
  //           width: 10,
  //         ),
  //         Text(message),
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
  //   );
  // }
}
