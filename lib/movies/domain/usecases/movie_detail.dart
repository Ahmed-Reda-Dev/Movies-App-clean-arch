import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/movies/domain/intities/movie_detail.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

class MovieDetialUseCase extends BaseUseCase<MovieDetail, MovieDetialParams> {
  BaseMoviesRepository repository;

  MovieDetialUseCase({required this.repository});

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetialParams prams) async {
    return await repository.getMovieDetial(prams);
  }
}

class MovieDetialParams extends Equatable {
  final int id;

  const MovieDetialParams({required this.id});

  @override
  List<Object?> get props => [id];
}
