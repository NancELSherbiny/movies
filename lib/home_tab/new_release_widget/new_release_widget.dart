
import 'package:flutter/material.dart';

import '../../api/api_manager.dart';
import '../../model/NewReleaseResponse.dart';
import 'new_release_slider.dart';

class NewReleaseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewReleaseResponse?>(
        future: ApiManager.getNewRelease(),
        builder: (context, snapshot) {
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
          if (snapshot.data?.status_message != null) {
            return Column(
              children: [
                Text(snapshot.data?.status_message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('try again'))
              ],
            );
          }
          var result2List = snapshot.data?.results ?? [];
          return NewReleaseSlider(
            newReleaseResult: result2List,
          );
        });
  }
}
