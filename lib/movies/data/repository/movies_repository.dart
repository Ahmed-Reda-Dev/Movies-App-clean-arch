import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movie_app/movies/domain/intities/movie_detail.dart';
import 'package:movie_app/movies/domain/intities/movies.dart';
import 'package:movie_app/movies/domain/intities/recommendations.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_recommendations.dart';
import 'package:movie_app/movies/domain/usecases/movie_detail.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource beseRemoteDataSource;

  MoviesRepository({required this.beseRemoteDataSource});

  @override
  Future<Either<Failure, List<Movies>>> getNowPlaying() async {
    final movies = await beseRemoteDataSource.gatPlayingMovies();
    try {
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopularMovies() async {
    final movies = await beseRemoteDataSource.getPopularMovies();
    try {
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRatedMovies() async {
    final movies = await beseRemoteDataSource.getTopRatedMovies();
    try {
      return Right(movies);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetial(
      MovieDetialParams prams) async {
    final movieDetial = await beseRemoteDataSource.getMovieDetial(prams);
    try {
      return Right(movieDetial);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(
      RecommendationsPrams prams) async {
    final recommendations =
        await beseRemoteDataSource.getRecommendations(prams);
    try {
      return Right(recommendations);
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.errorMessageModel.message));
    }
  }
}
