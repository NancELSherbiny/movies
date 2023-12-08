import 'package:flutter/material.dart';
import 'package:movies/home_tab/recomendded_widget/recommended_slider.dart';

import '../../api/api_manager.dart';
import '../../model/TopRatedResponse.dart';


class RecommendedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedResponse?>(
        future: ApiManager.getRecommendedMov(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(
                  '\n${snapshot.error}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                ElevatedButton(onPressed: () {}, child: Text('try again'))
              ],
            );
          }
          if (snapshot.data?.success == false) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ""),
                ElevatedButton(onPressed: () {}, child: Text('try again'))
              ],
            );
          }
          var resultslist = snapshot.data?.results ?? [];
          return RecommendedSlider(
            results: resultslist,
          );
        });
  }
}
