import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/top_screen.dart';
import './screens/tabs_screen.dart';
import './screens/my_page_screen.dart';
import './screens/search_movie_screen2.dart';
import './providers/search_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchMovie(),
        )
      ],
      child: MaterialApp(
        title: 'このみーる',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.deepPurple,
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
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsScreen(),
          TopScreen.routeName: (ctx) => TopScreen(),
          SearchMovieScreen2.routeName: (ctx) => SearchMovieScreen2(),
          MyPageScreen.routeName: (ctx) => MyPageScreen(),
        },
      ),
    );
  }
}
