import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constance.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../core/utils/enums.dart';
import '../controllers/movie_bloc/movies_bloc.dart';
import '../controllers/movie_bloc/movies_state.dart';
import 'movie_detail_screen.dart';

class PopulaScreen extends StatelessWidget {
  const PopulaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final movies = state.popularMovies;
        switch (state.popularMoviesRequestState) {
          case RequestState.loading:
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade800,
              highlightColor: Colors.grey.shade900,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade800,
                    ),
                  );
                },
              ),
            );
          case RequestState.loaded:
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: const Text('Popular Movies'),
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return GestureDetector(
                          onTap: () {
                            AppNavigator.push(
                              context,
                              MovieDetailScreen(id: movies[index].id),
                            );
                          },
                          child: Container(
                              margin: const EdgeInsets.all(10.0),
                              height: 155,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.black38,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: CachedNetworkImage(
                                        imageUrl: ApiConstance.imageUrl(
                                            movies[index].backdropPath),
                                        width: 120,
                                        height: 140,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          baseColor: Colors.grey.shade800,
                                          highlightColor: Colors.grey.shade900,
                                          child: Container(
                                            width: 120,
                                            height: 155,
                                            decoration: BoxDecoration(
                                              color: Colors.grey.shade800,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movies[index].title,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          const SizedBox(height: 5.0),
                                          Row(
                                            children: [
                                              //release year
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    right: 15.0),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 8.0,
                                                  vertical: 4.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Text(
                                                  movies[index]
                                                      .releaseDate
                                                      .split('-')[0],
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ),

                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                              ),
                                              const SizedBox(width: 5.0),
                                              Text(
                                                (movies[index].voteAverage / 2)
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: Colors.white70,
                                                    ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15.0),
                                          Text(
                                            movies[index].overview,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  color: Colors.white70,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      },
                      childCount: movies.length,
                    ),
                  ),
                ],
              ),
            );

          case RequestState.error:
            return const Center(
              child: Text('Error'),
            );
        }
      },
    );
  }
}
