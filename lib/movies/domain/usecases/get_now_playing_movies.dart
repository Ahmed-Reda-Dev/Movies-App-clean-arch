import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/intities/movies.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';

class GetNowPlayingMoviesUsecase extends BaseUseCase<List<Movies>, NoPrams> {
  final BaseMoviesRepository repository;

  GetNowPlayingMoviesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoPrams prams) async {
    return await repository.getNowPlaying();
  }
}
