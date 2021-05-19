import 'package:flutter/material.dart';

import '../screens/top_screen.dart';
import 'mypage/mypage_screen.dart';
import 'search_movie_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': TopScreen(),
        'title': 'Home',
      },
      {
        'page': SearchMovieScreen(),
        'title': 'Search',
      },
      {
        'page': MyPageScreen(),
        'title': 'MyPage',
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: <Widget>[
          if (_pages[_selectedPageIndex]['title'] == 'MyPage')
            IconButton(
              icon: Icon(
                Icons.edit_sharp,
                color: Colors.white,
              ),
              onPressed: () {
                print('マイページ');
              },
            )
        ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.movie),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.person),
            label: 'My Page',
          ),
        ],
      ),
    );
  }
}
