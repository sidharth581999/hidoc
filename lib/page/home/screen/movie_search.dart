import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/app_colors.dart';
import 'package:movie/config/size_config.dart';
import 'package:movie/page/home/bloc/home_bloc.dart';
import 'package:movie/page/home/widgets/appbar_section.dart';
import 'package:movie/page/home/widgets/movie_tile.dart';
import 'package:movie/widgets/shimmer_loading.dart';
import 'package:movie/widgets/textfields.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({super.key});

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(22, 16, 22, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSection(),
              SizedBox(height: SizeConfig.sh(3)),

              // Search field
              CustomSerchBox(
                searchController: searchController,
                hint: "Search movies",
                prefix: const Icon(
                  Icons.search,
                  color: AppConfig.greyLoginDesColor,
                ),
                onSubmit: (newValue) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(MovieSearchEvent(search: searchController.text));
                },
                fillColor: AppConfig.blackLight,
              ),

              SizedBox(height: SizeConfig.sh(4)),

              // Movie tile section
              Expanded(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is HomeBuildStae) {
                      if (state.isLoading) {
                        return const ShimmerWidget(enabled: true);
                      } else if (state.isError) {
                        return Center(
                          child: Text(
                            state.errorMsg ?? "Oops! Something went wrong",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: AppConfig.greyLightText),
                          ),
                        );
                      } else {
                        final movies = state.movies?.search ?? [];
                        final movieList = state.movieList ?? [];

                        return GridView.builder(
                          itemCount: state.isInit
                              ? movieList.length
                              : movies.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 18,
                            childAspectRatio: 0.6,
                          ),
                          itemBuilder: (context, index) {
                            return MovieTile(
                              movie: state.isInit ? null : movies[index],
                              isinit: state.isInit,
                              storedMovie: state.isInit
                                  ? (index < movieList.length
                                      ? movieList[index]
                                      : null)
                                  : null,
                            );
                          },
                        );
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
