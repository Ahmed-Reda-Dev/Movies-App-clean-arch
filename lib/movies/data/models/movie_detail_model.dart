import 'package:movie_app/movies/domain/intities/movie_detail.dart';

import 'geners_model.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      backdropPath: json['backdrop_path'] ?? "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
      genres: List<GenersModel>.from(
          json['genres'].map((e) => GenersModel.fromJson(e))),
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
