part of 'movie_detail_bloc.dart';

abstract class MovieDetialBlocEvent extends Equatable {
  const MovieDetialBlocEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetialEvent extends MovieDetialBlocEvent {
  final int id;

  const GetMovieDetialEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDetialBlocEvent {
  final int id;

  const GetMovieRecommendationsEvent({required this.id});

  @override
  List<Object> get props => [id];
}
