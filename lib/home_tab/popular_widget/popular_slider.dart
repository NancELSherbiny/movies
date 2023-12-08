import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/home_tab/popular_widget/popular_item.dart';
import '../../model/popularResponse.dart';
import '../../movie_details_screen/movies_details.dart';

class PopularSlider extends StatelessWidget {
  List<PopularResult> resultsList;

  PopularSlider({required this.resultsList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(height: 238.0),
      itemCount: resultsList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          InkWell(
              onTap: () {
               Navigator.pushNamed(context, MoviesDetails.routeName,
                   arguments: resultsList?[itemIndex].id);
              },
              child: PopularItem(results: resultsList[itemIndex])),
    );
  }
}
