
import 'package:flutter/material.dart';
import 'package:movies/home_tab/popular_widget/popular_slider.dart';

import '../../api/api_manager.dart';
import '../../model/popularResponse.dart';

class PopularWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PopularResponse?>(
      future: ApiManager.getPopular(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            heightFactor: 10,
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
        if (snapshot.data?.success== false) {
          return Column(
            children: [
              Text(snapshot.data?.status_message ?? ''),
              ElevatedButton(onPressed: () {}, child: Text('try again'))
            ],
          );
        }
        var resultsList = snapshot.data?.results ?? [];
        return PopularSlider(resultsList: resultsList);
      },
    );
  }
}
