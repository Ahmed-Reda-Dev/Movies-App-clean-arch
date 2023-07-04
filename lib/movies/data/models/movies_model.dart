import '../../domain/intities/movies.dart';

class MoviesModel extends Movies {
  const MoviesModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.adult,
    required super.overview,
    required super.genreIds,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'],
      adult: json['adult'],
      overview: json['overview'],
      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      voteAverage: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
