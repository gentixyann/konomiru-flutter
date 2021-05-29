import * as functions from "firebase-functions";
import * as admin from 'firebase-admin';
admin.initializeApp();
const db = admin.firestore();

// userがマイラブにmovieを追加したときに発動
exports.makeLikedMovies = functions.region('asia-northeast1').firestore
    .document('users/{userId}/movies/{movieDoc}')
    .onWrite((change, context) => {

});