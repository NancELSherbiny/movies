import 'package:flutter/material.dart';
import 'package:movies/home_page.dart';
import 'package:movies/movie_details_screen/movies_details.dart';

import 'movie_details_screen/movies_details_widget.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        MoviesDetails.routeName: (context) => MoviesDetails(),
      },
    );
  }
}
