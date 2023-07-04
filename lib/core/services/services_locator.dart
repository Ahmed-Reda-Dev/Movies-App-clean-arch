import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movies_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/movies/domain/usecases/get_pepular_movies.dart';

import '../../movies/domain/usecases/get_recommendations.dart';
import '../../movies/domain/usecases/get_top_rated_movies.dart';
import '../../movies/domain/usecases/movie_detail.dart';
import '../../movies/presentation/controllers/movie_bloc/movies_bloc.dart';
import '../../movies/presentation/controllers/movie_detail_bloc/movie_detail_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Movie Bloc
    sl.registerFactory(
      () => MoviesBloc(sl(), sl(), sl()),
    );
    sl.registerFactory(() => MovieDetialBloc(sl(), sl()));

    // Use cases
    sl.registerLazySingleton(
        () => GetNowPlayingMoviesUsecase(repository: sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUseCase(repository: sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUsescase(repository: sl()));

    sl.registerLazySingleton(() => MovieDetialUseCase(repository: sl()));

    sl.registerLazySingleton(
        () => GetRecommendationsUseCase(baseMoviesRepository: sl()));

    //Repositories
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(beseRemoteDataSource: sl()));

    // Data sources
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
        () => MoviesRemoteDataSource());
  }
}
