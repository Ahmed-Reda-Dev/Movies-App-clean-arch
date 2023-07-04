import 'package:movie_app/movies/domain/intities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({
    required super.id,
    super.backdropPath,
  });

  factory RecommendationsModel.fromJson(Map<String, dynamic> json) {
    return RecommendationsModel(
      id: json['id'],
      backdropPath: json['backdrop_path'] ?? '/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg',
    );
  }
}
