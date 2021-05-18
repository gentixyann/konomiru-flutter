import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/top_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/my_page/my_page_screen.dart';
import 'screens/search_movie_screen.dart';
import './providers/search_movie.dart';
import 'providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/search_movie_detail_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './screens/auth/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('読み込みでエラー発生' + snapshot.error),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return Home();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchMovie(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider()..fetchUserData(),
        )
      ],
      child: MaterialApp(
        title: 'このみーる',
        theme: ThemeData(
          primaryColor: Colors.amber[600],
          backgroundColor: Colors.pink,
          accentColor: Colors.black54,
          accentColorBrightness: Brightness.dark,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
            bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.pink,
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return TabsScreen();
            } else {
              return AuthScreen();
            }
          },
        ),
        routes: {
          TopScreen.routeName: (ctx) => TopScreen(),
          SearchMovieScreen.routeName: (ctx) => SearchMovieScreen(),
          MyPageScreen.routeName: (ctx) => MyPageScreen(),
          SearchMovieDetailScreen.routeName: (ctx) => SearchMovieDetailScreen(),
        },
      ),
    );
  }
}
