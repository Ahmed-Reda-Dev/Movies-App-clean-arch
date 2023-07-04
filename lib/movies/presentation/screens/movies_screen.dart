import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/app_navigator.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movies/presentation/components/playing_now_components.dart';
import 'package:movie_app/movies/presentation/components/popular_components.dart';
import 'package:movie_app/movies/presentation/components/top_rated_componennts.dart';
import 'package:movie_app/movies/presentation/screens/popular_screen.dart';
import 'package:movie_app/movies/presentation/screens/top_rated_screen.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PlayingNowComponents(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.popular,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AppNavigator.push(context, const PopulaScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(AppString.seeMore,
                              style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularComponents(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.topRated,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AppNavigator.push(context, const TopRatedScreen());
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(AppString.seeMore,
                              style: TextStyle(color: Colors.white)),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedComponents(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
