import 'package:flutter/material.dart';
import 'package:movies/model/TopRatedResponse.dart';

import '../../my_theme.dart';


class RecommendedItem extends StatelessWidget {
  TopRatedResult results;

  RecommendedItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      color: MyTheme.borderGrey,
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              width: 120,
              height: 105,
              child: Image.network(
                  fit: BoxFit.fill,
                  'https://image.tmdb.org/t/p/w500' + results.posterPath!),
            ),
            Icon(
              Icons.bookmark,
              color: MyTheme.selectedYellow,
              size: 39,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                width: 39,
                height: 35,
                child: Icon(
                  Icons.add,
                  color: MyTheme.white,
                  size: 20,
                ),
              ),
            ),
          ]),
          Row(
            children: [
              Icon(
                Icons.star,
                color: MyTheme.selectedYellow,
                size: 18,
              ),
              Text(
                '${results.voteAverage}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
          Container(
            height: 13,
            child: Text(
              results.originalTitle ?? "",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          Text(
            results.releaseDate ?? "",
            style: TextStyle(color: Colors.white, fontSize: 12),
          )
        ],
      ),
    );
  }
}
