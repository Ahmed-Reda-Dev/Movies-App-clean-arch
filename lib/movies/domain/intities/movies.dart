import 'package:equatable/equatable.dart';

class Movies extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final bool adult;
  final String overview;
  final List<int> genreIds;
  final double voteAverage;
  final String releaseDate;

  const Movies({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.adult,
    required this.overview,
    required this.genreIds,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props {
    return [
      id,
      title,
      backdropPath,
      adult,
      overview,
      genreIds,
      voteAverage,
      releaseDate,
    ];
  }
}
