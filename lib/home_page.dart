
import 'package:flutter/material.dart';

import 'home_tab/home_tab.dart';
import 'my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime movieTime = DateTime.now();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.black,
        bottomNavigationBar: Container(
          color: MyTheme.black,
          child: BottomNavigationBar(
            elevation: 0,
            unselectedItemColor: MyTheme.lightGrey,
            fixedColor: MyTheme.selectedYellow,
            backgroundColor: MyTheme.grey,
            showUnselectedLabels: true,
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'SEARCH'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie_creation), label: 'BROWSE'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections_bookmark_sharp),
                  label: 'WATCHLIST')
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
   HomeTab(),
    //SearchTab(),
   // CategoriesTap(),
   // WatchListTab(),
  ];
}
