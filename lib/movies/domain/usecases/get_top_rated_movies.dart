import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../intities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUsescase extends BaseUseCase<List<Movies>, NoPrams> {
  final BaseMoviesRepository repository;

  GetTopRatedMoviesUsescase({required this.repository});

  @override
  Future<Either<Failure, List<Movies>>> call(NoPrams prams) async {
    return await repository.getTopRatedMovies();
  }
}
