class ApiConstance {
  // Base URL & API Key
  static const String baseUrl = "https://api.themoviedb.org/3/";

  static const String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  static const String apiKey = "api_key=b53d2f5e0bf1e5d734ce5dbe9d6504b2";

  // Endpoints
  static const String popularMovies = "movie/popular?";

  static const String nowPlaying = "movie/now_playing?";

  static const String topRated = "movie/top_rated?";

  static const String movieDetial = "movie/";

  static const String recommendations = "recommendations?";

  // Paths
  static const String nowPlayingPath = "$baseUrl$nowPlaying$apiKey";

  static const String popularMoviesPath = "$baseUrl$popularMovies$apiKey";

  static const String topRatedPath = "$baseUrl$topRated$apiKey";

  static String movieDetialPath(int id) => "$baseUrl$movieDetial$id?$apiKey";

  static String recommendationsPath(int id) =>
      "$baseUrl$movieDetial$id/$recommendations$apiKey";

  // Images

  static String imageUrl(String path) => "$imageBaseUrl$path";
}
