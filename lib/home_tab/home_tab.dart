
import 'package:flutter/material.dart';
import 'package:movies/home_tab/new_release_widget/new_release_widget.dart';
import 'package:movies/home_tab/popular_widget/popular_widget.dart';
import 'package:movies/home_tab/recomendded_widget/recommended_widget.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PopularWidget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          NewReleaseWidget(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          RecommendedWidget()
        ],
      ),
    );
  }
}
