import 'dart:convert';

import 'package:movies/model/MovieDetailsResponse.dart';

import '../model/NewReleaseResponse.dart';
import '../model/SimilarResponse.dart';
import '../model/TopRatedResponse.dart';
import '../model/popularResponse.dart';
import 'api_constants.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<PopularResponse?> getPopular() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.popularApi, {
      'api_key' : '1002246da95d86d677fb57f7198312a5',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDAyMjQ2ZGE5NWQ4NmQ2NzdmYjU3ZjcxOTgzMTJhNSIsInN1YiI6IjY1NzMwZDRhOTQ1YzIwMDBlYTRmMjJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByGjWGf3HvJOH-wEqq2TgJb3VY9s3A--9vS_cw1kUeU',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return PopularResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }


  static Future<NewReleaseResponse?> getNewRelease() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.newReleaseApi, {
      'api_key' : '1002246da95d86d677fb57f7198312a5',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDAyMjQ2ZGE5NWQ4NmQ2NzdmYjU3ZjcxOTgzMTJhNSIsInN1YiI6IjY1NzMwZDRhOTQ1YzIwMDBlYTRmMjJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByGjWGf3HvJOH-wEqq2TgJb3VY9s3A--9vS_cw1kUeU',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return NewReleaseResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<TopRatedResponse?> getRecommendedMov() async {
    Uri url = Uri.https(ApiCostants.baseUrl, ApiCostants.recommendedApi, {
      'api_key' : '1002246da95d86d677fb57f7198312a5',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDAyMjQ2ZGE5NWQ4NmQ2NzdmYjU3ZjcxOTgzMTJhNSIsInN1YiI6IjY1NzMwZDRhOTQ1YzIwMDBlYTRmMjJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByGjWGf3HvJOH-wEqq2TgJb3VY9s3A--9vS_cw1kUeU',
    });
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return TopRatedResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<MovieDetailsResponse?> getDetails(String movieId) async {
    Uri url = Uri.https(
      ApiCostants.baseUrl,
      ApiCostants.detailsApi + movieId, {
      'api_key' : '1002246da95d86d677fb57f7198312a5',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDAyMjQ2ZGE5NWQ4NmQ2NzdmYjU3ZjcxOTgzMTJhNSIsInN1YiI6IjY1NzMwZDRhOTQ1YzIwMDBlYTRmMjJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByGjWGf3HvJOH-wEqq2TgJb3VY9s3A--9vS_cw1kUeU',
    }
    );
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<SimilarResponse?> getSimilar(String movieId) async {
    Uri url = Uri.https(
      ApiCostants.baseUrl,
      "/3/movie/$movieId/similar",{
      'api_key' : '1002246da95d86d677fb57f7198312a5',
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDAyMjQ2ZGE5NWQ4NmQ2NzdmYjU3ZjcxOTgzMTJhNSIsInN1YiI6IjY1NzMwZDRhOTQ1YzIwMDBlYTRmMjJkNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ByGjWGf3HvJOH-wEqq2TgJb3VY9s3A--9vS_cw1kUeU',
    }
    );
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SimilarResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }



}
