part of 'movie_detail_bloc.dart';

class MovieDetialBlocState extends Equatable {
  final MovieDetail? movieDetial;
  final RequestState movieDetialRequestState;
  final String movieDetialErrorMessage;

  final List<Recommendations> movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsErrorMessage;

  const MovieDetialBlocState({
    this.movieDetial,
    this.movieDetialRequestState = RequestState.loading,
    this.movieDetialErrorMessage = '',
    this.movieRecommendations = const [],
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsErrorMessage = '',
  });

  MovieDetialBlocState copyWith({
    MovieDetail? movieDetial,
    RequestState? movieDetialRequestState,
    String? movieDetialErrorMessage,
    List<Recommendations>? movieRecommendations,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsErrorMessage,
  }) {
    return MovieDetialBlocState(
      movieDetial: movieDetial ?? this.movieDetial,
      movieDetialRequestState:
          movieDetialRequestState ?? this.movieDetialRequestState,
      movieDetialErrorMessage:
          movieDetialErrorMessage ?? this.movieDetialErrorMessage,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsRequestState: movieRecommendationsRequestState ??
          this.movieRecommendationsRequestState,
      movieRecommendationsErrorMessage: movieRecommendationsErrorMessage ??
          this.movieRecommendationsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetial,
        movieDetialRequestState,
        movieDetialErrorMessage,
        movieRecommendations,
        movieRecommendationsRequestState,
        movieRecommendationsErrorMessage,
      ];
}
