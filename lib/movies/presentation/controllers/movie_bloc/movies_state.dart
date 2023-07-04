import 'package:equatable/equatable.dart';

import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/intities/movies.dart';

class MoviesState extends Equatable {
  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingMoviesRequestState;
  final String nowPlayingMoviesErrorMessage;

  final List<Movies> popularMovies;
  final RequestState popularMoviesRequestState;
  final String popularMoviesErrorMessage;

  final List<Movies> topRatedMovies;
  final RequestState topRatedMoviesRequestState;
  final String topRatedMoviesErrorMessage;

  MoviesState copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingMoviesRequestState,
    String? nowPlayingMoviesErrorMessage,
    List<Movies>? popularMovies,
    RequestState? popularMoviesRequestState,
    String? popularMoviesErrorMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedMoviesRequestState,
    String? topRatedMoviesErrorMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesRequestState:
          nowPlayingMoviesRequestState ?? this.nowPlayingMoviesRequestState,
      nowPlayingMoviesErrorMessage:
          nowPlayingMoviesErrorMessage ?? this.nowPlayingMoviesErrorMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesRequestState:
          popularMoviesRequestState ?? this.popularMoviesRequestState,
      popularMoviesErrorMessage:
          popularMoviesErrorMessage ?? this.popularMoviesErrorMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesRequestState:
          topRatedMoviesRequestState ?? this.topRatedMoviesRequestState,
      topRatedMoviesErrorMessage:
          topRatedMoviesErrorMessage ?? this.topRatedMoviesErrorMessage,
    );
  }

  const MoviesState({
    this.nowPlayingMovies = const <Movies>[],
    this.nowPlayingMoviesRequestState = RequestState.loading,
    this.nowPlayingMoviesErrorMessage = '',
    this.popularMovies = const <Movies>[],
    this.popularMoviesRequestState = RequestState.loading,
    this.popularMoviesErrorMessage = '',
    this.topRatedMovies = const <Movies>[],
    this.topRatedMoviesRequestState = RequestState.loading,
    this.topRatedMoviesErrorMessage = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingMoviesRequestState,
        nowPlayingMoviesErrorMessage,
        popularMovies,
        popularMoviesRequestState,
        popularMoviesErrorMessage,
        topRatedMovies,
        topRatedMoviesRequestState,
        topRatedMoviesErrorMessage,
      ];
}
