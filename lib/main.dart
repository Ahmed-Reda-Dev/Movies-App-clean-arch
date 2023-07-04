import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

import 'movies/presentation/controllers/movie_bloc/movies_bloc.dart';
import 'movies/presentation/controllers/movie_bloc/movies_event.dart';

void main() {
  //transparency status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final int id = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (context) => sl<MoviesBloc>()
            ..add(GetPopularMoviesEvent())
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
      ],
      child: MaterialApp(
        title: AppString.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        home: const MoviesScreen(),
      ),
    );
  }
}
