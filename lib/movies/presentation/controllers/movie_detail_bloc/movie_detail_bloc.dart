import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/movie_detail.dart';

import '../../../domain/intities/movie_detail.dart';
import '../../../domain/intities/recommendations.dart';
import '../../../domain/usecases/get_recommendations.dart';

part 'movie_detail_bloc_event.dart';
part 'movie_detail_bloc_state.dart';

class MovieDetialBloc extends Bloc<MovieDetialBlocEvent, MovieDetialBlocState> {
  final MovieDetialUseCase movieDetialUseCase;
  final GetRecommendationsUseCase movieRecommendationsUseCase;
  MovieDetialBloc(this.movieDetialUseCase, this.movieRecommendationsUseCase)
      : super(const MovieDetialBlocState()) {
    on<GetMovieDetialEvent>(_getMovieDetial);

    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetial(
      GetMovieDetialEvent event, Emitter<MovieDetialBlocState> emit) async {
    final result = await movieDetialUseCase(MovieDetialParams(id: event.id));
    result.fold(
      (fuliar) => emit(state.copyWith(
        movieDetialRequestState: RequestState.error,
        movieDetialErrorMessage: fuliar.message,
      )),
      (movieDetial) => emit(state.copyWith(
        movieDetialRequestState: RequestState.loaded,
        movieDetial: movieDetial,
      )),
    );
  }

  FutureOr<void> _getMovieRecommendations(GetMovieRecommendationsEvent event,
      Emitter<MovieDetialBlocState> emit) async {
    final result = await movieRecommendationsUseCase(
        RecommendationsPrams(movieId: event.id));
    result.fold(
      (fuliar) => emit(state.copyWith(
        movieRecommendationsRequestState: RequestState.error,
        movieRecommendationsErrorMessage: fuliar.message,
      )),
      (movieRecommendations) => emit(state.copyWith(
        movieRecommendationsRequestState: RequestState.loaded,
        movieRecommendations: movieRecommendations,
      )),
    );
  }
}
