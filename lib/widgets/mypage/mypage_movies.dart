import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPageMovies extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  fetchUserMovies() async {
    final userId = _firebaseAuth.currentUser.uid;
    return await _firestore.collection('users/${userId}/movies').get();
  }

  @override
  Widget build(BuildContext context) {
    final userId = _firebaseAuth.currentUser.uid;
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users/${userId}/movies').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Text(snapshot.data.docs[index].data()['id'].toString());
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
