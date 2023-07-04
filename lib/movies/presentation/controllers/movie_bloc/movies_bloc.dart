import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/base_use_case.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_movies.dart';

import '../../../domain/usecases/get_pepular_movies.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetPopularMoviesUseCase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsescase getTopRatedMoviesUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMoviesUsecase(NoPrams());
    result.fold(
      (fuliar) => emit(state.copyWith(
        nowPlayingMoviesRequestState: RequestState.error,
        nowPlayingMoviesErrorMessage: fuliar.message,
      )),
      (movies) => emit(state.copyWith(
        nowPlayingMoviesRequestState: RequestState.loaded,
        nowPlayingMovies: movies,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUsecase(NoPrams());
    result.fold(
      (fuliar) => emit(state.copyWith(
        popularMoviesRequestState: RequestState.error,
        popularMoviesErrorMessage: fuliar.message,
      )),
      (movies) => emit(state.copyWith(
        popularMoviesRequestState: RequestState.loaded,
        popularMovies: movies,
      )),
    );
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUsecase(NoPrams());
    result.fold(
      (fuliar) => emit(state.copyWith(
        topRatedMoviesRequestState: RequestState.error,
        topRatedMoviesErrorMessage: fuliar.message,
      )),
      (movies) => emit(state.copyWith(
        topRatedMoviesRequestState: RequestState.loaded,
        topRatedMovies: movies,
      )),
    );
  }
}
