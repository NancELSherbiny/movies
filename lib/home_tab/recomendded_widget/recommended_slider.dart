import 'package:flutter/material.dart';
import 'package:movies/home_tab/recomendded_widget/recommended_item.dart';
import 'package:movies/model/TopRatedResponse.dart';

import '../../my_theme.dart';



class RecommendedSlider extends StatelessWidget {
  List<TopRatedResult> results;

  RecommendedSlider({required this.results});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: MyTheme.grey,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recommended',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RecommendedItem(
                  results: results[index],
                );
              },
              itemCount: results.length,
            ),
          )
        ],
      ),
    );
  }
}
