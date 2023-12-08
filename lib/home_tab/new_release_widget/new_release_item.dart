
import 'package:flutter/material.dart';
import '../../model/NewReleaseResponse.dart';
import '../../my_theme.dart';

class NewReleaseItem extends StatelessWidget {
  NewReleaseResult results;

  NewReleaseItem({required this.results});

  @override
  Widget build(BuildContext context) {
    return
      Stack(children: [
      Image.network(
        height: 200,
        'https://image.tmdb.org/t/p/w500' + results.posterPath!,
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
    ]);
  }
}
