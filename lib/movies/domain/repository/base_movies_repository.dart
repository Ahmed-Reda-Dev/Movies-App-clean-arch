import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/intities/movie_detail.dart';
import 'package:movie_app/movies/domain/intities/recommendations.dart';
import 'package:movie_app/movies/domain/usecases/movie_detail.dart';

import '../../../core/error/failure.dart';
import '../intities/movies.dart';
import '../usecases/get_recommendations.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movies>>> getNowPlaying();

  Future<Either<Failure, List<Movies>>> getPopularMovies();

  Future<Either<Failure, List<Movies>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetial(MovieDetialParams prams);

  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsPrams prams);
}
