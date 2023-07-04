import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/movies/domain/intities/recommendations.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_use_case.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationsUseCase
    extends BaseUseCase<List<Recommendations>, RecommendationsPrams> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Recommendations>>> call(
      RecommendationsPrams prams) async {
    return await baseMoviesRepository.getRecommendations(prams);
  }
}

class RecommendationsPrams extends Equatable {
  final int movieId;

  const RecommendationsPrams({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
