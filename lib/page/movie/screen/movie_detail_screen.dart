// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/app_colors.dart';
import 'package:movie/config/size_config.dart';
import 'package:movie/page/movie/bloc/movie_detail_bloc.dart';
import 'package:movie/utils/commonfunctions.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight * 0.63;

    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailBuildState) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator(),);
            } else if (state.isError) {
              return Center(child: Text(state.errorMsg ?? "Oops! Something went wrong"));
            } else {
              final genreList = state.movie?.genre != null && state.movie!.genre!.isNotEmpty
                  ? state.movie?.genre!.split(',').map((e) => e.trim()).toList()
                  : [];

              return Stack(
                children: [
                  // Movie poster background
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: imageHeight,
                    child: Image.network(
                      state.movie?.poster ?? "",
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  // Dark gradient fade at bottom of poster
                  Positioned(
                    top: imageHeight - 60,
                    left: 0,
                    right: 0,
                    height: 60,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, AppConfig.blackLight],
                        ),
                      ),
                    ),
                  ),

                  // Bottom detail card
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: SizeConfig.sh(55),
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: const Offset(-10, 0),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: const Offset(10, 0),
                          ),
                        ],
                        color: AppConfig.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.movie?.title ?? "",
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Icon(Icons.star_border, size: 16, color: Colors.white),
                                const SizedBox(width: 4),
                                Text(state.movie?.imdbRating ?? "0", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white)),
                                const SizedBox(width: 16),
                                const Icon(Icons.access_time, size: 16, color: Colors.white),
                                const SizedBox(width: 4),
                                Text(state.movie?.runtime ?? "", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white)),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Tags
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(state.movie?.type ?? "", style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white)),
                                Wrap(
                                  spacing: 8,
                                  children: genreList!
                                      .map((genre) => _buildTag(genre, context))
                                      .toList(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),

                            // Plot
                            Text(
                              state.movie?.plot ?? "",
                              style:  Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white),
                            ),
                            const SizedBox(height: 12),

                            // Directors & Writers
                            Text(
                              "Director: ${state.movie?.director ?? ""}",
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white),
                            ),
                            Text(
                              formatLabelledMultilineText("Writer", state.movie?.writer),
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              formatLabelledMultilineText("Actors", state.movie?.actors),
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Back button at top-left
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 8,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildTag(String label, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppConfig.white),
      ),
    );
  }
}
