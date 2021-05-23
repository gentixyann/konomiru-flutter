import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel(DocumentSnapshot doc) {
    uid = doc.id;
    email = doc.data()['email'];
    displayName = doc.data()['displayName'];
    photoURL = doc.data()['photoURL'];
    introText = doc.data()['introText'];
  }
  String uid;
  String email;
  String displayName;
  String photoURL;
  String introText;
}

// class UserModel {
//   String uid;
//   String email;
//   String displayName;
//   String photoURL;
//   String introText;

//   UserModel({
//     this.uid,
//     this.email,
//     this.displayName,
//     this.photoURL,
//     this.introText,
//   });
// }
