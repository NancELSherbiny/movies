import 'package:flutter/material.dart';
import 'package:movies/model/MovieDetailsResponse.dart';
import 'package:movies/movie_details_screen/movies_details_widget.dart';
import '../api/api_manager.dart';

class MoviesDetails extends StatelessWidget {
  static const String routeName = 'movie_details';
  @override
  Widget build(BuildContext context) {
    var resultsList = ModalRoute.of(context)?.settings.arguments as int?;
    return Column(
      children: [
        FutureBuilder<MovieDetailsResponse?>(
            future: ApiManager.getDetails(resultsList.toString()),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text(" something went wrong"),
                    ElevatedButton(
                        onPressed: () {
                          ApiManager.getDetails(resultsList.toString());
                        },
                        child: Text("Try Again"))
                  ],
                );
              }
              if (snapshot.data?.success == false) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ''),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again"))
                  ],
                );
              }
              var movies = snapshot.data!;
              return MoviesDetailsWidget(result: movies);
            }),
      ],
    );
  }
}
