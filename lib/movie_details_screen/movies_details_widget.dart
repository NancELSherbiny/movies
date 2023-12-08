import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/MovieDetailsResponse.dart';
import 'package:movies/movie_details_screen/similar_slider.dart';
import '../api/api_manager.dart';
import '../model/SimilarResponse.dart';
import '../my_theme.dart';

class MoviesDetailsWidget extends StatelessWidget {
  MovieDetailsResponse result;
  MoviesDetailsWidget({required this.result});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              result?.title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: MyTheme.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18)),
                      child: Container(
                        child: CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/w500" +
                              result.backdropPath!,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          )),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      result.title ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      result.releaseDate ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.lightGrey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CachedNetworkImage(
                          height: 150,
                          imageUrl: "https://image.tmdb.org/t/p/w500" +
                              result.posterPath!,
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          )),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 238,
                          height: 160,
                          child: Text(
                            result.overview ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: MyTheme.white),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<SimilarResponse?>(
                        future: ApiManager.getSimilar(result.id.toString()),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              heightFactor: 10,
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Column(
                              children: [
                                Text(
                                  '\n${snapshot.error}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('try again'))
                              ],
                            );
                          }
                          if (snapshot.data?.success == false) {
                            return Column(
                              children: [
                                Text(snapshot.data?.status_message ?? ''),
                                ElevatedButton(
                                    onPressed: () {}, child: Text('try again'))
                              ],
                            );
                          }
                          var res = snapshot.data?.results;
                          return SimilarSlider(similarResult: res ?? []);
                        })
                  ]),
            ),
          )),
    );
  }
}
