import 'dart:convert';
import 'dart:developer';
import 'package:movie/features/home/data/models/lib/models/movie_detail_model.dart';

import 'package:movie/core/utils/utils.dart';
import 'package:movie/features/home/data/models/lib/models/movie_recommendation_mode.dart';

import '../../features/home/data/models/lib/models/up_coming_movie_model.dart';

import 'package:http/http.dart' as http;

var key = "?api_key=$apiKey";

late String endPoint;

class ApiServices {
  Future<List<UpcomingMovieModel>> getUpComingMovies() async {
    endPoint = "movie/upcoming";
    final url = "$baseUrl/$endPoint$key";

    final response = await http.get(Uri.parse(url));

    log('Status : ${response.body}');
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<UpcomingMovieModel> movies =
          data.map((movie) => UpcomingMovieModel.fromJson(movie)).toList();

      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
   Future<MovieDetailModel> getMovieDetail(int movieId) async {
    endPoint = 'movie/$movieId';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieDetailModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }
   Future<MovieRecommendationsModel> getMovieRecommendations(int movieId) async {
    endPoint = 'movie/$movieId/recommendations';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      log('success');
      return MovieRecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load  movie details');
  }

}
