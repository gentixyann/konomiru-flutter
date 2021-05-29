import * as functions from "firebase-functions";
import * as admin from 'firebase-admin';
admin.initializeApp();
const db = admin.firestore();

// userがマイラブにmovieを追加したときに発動
exports.makeLikedMovies = functions.region('asia-northeast1').firestore
    .document('users/{userId}/movies/{movieDoc}')
    .onWrite((change, context) => {
    
        const userId = context.params.userId;
        const movieId = context.params.movieDoc;
        const likedMoviesRef = db.collection(`likedMovies/${movieId}/users`);

        if (!change.before.exists) {
            // 新しく追加された時
            
        } else if (change.before.exists && !change.before.exists) {
            // 削除された時
        }

});