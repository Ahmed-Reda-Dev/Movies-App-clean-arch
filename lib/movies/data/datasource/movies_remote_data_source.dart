import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/api_constance.dart';
import 'package:movie_app/movies/data/models/movies_model.dart';
import 'package:movie_app/movies/domain/usecases/movie_detail.dart';

import '../../../core/network/error_model.dart';
import '../../domain/usecases/get_recommendations.dart';
import '../models/movie_detail_model.dart';
import '../models/recommendations_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> gatPlayingMovies();

  Future<List<MoviesModel>> getPopularMovies();

  Future<List<MoviesModel>> getTopRatedMovies();

  Future<MovieDetailModel> getMovieDetial(MovieDetialParams prams);

  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsPrams prams);
}

class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> gatPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingPath);

    if (response.statusCode == 200) {
      final movies = response.data['results'] as List;
      return movies.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);

    if (response.statusCode == 200) {
      final movies = response.data['results'] as List;
      return movies.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedPath);

    if (response.statusCode == 200) {
      final movies = response.data['results'] as List;
      return movies.map((e) => MoviesModel.fromJson(e)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetial(MovieDetialParams prams) async {
    final detialPath = ApiConstance.movieDetialPath(prams.id);
    final response = await Dio().get(detialPath);

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsPrams prams) async {
    final recommendationsPath = ApiConstance.recommendationsPath(prams.movieId);
    final response = await Dio().get(recommendationsPath);
    if (response.statusCode == 200) {
      final recommendations = response.data['results'] as List;
      return recommendations
          .map((e) => RecommendationsModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
