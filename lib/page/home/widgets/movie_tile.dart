
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/app_colors.dart';
import 'package:movie/config/app_routes.dart';
import 'package:movie/models/hive_search.dart';
import 'package:movie/models/serch_model.dart';
import 'package:movie/page/movie/bloc/movie_detail_bloc.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    super.key,
    required this.movie,
  required this.isinit,
  required this.storedMovie
  });

  final SearchedMovie? movie;
  final bool isinit;
  final Search? storedMovie;
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<MovieDetailBloc>(context).add(MovieTileClickedEvent(movieName: isinit? storedMovie?.imdbId??"": movie!.imdbId??""));
        Navigator.pushNamed(context, AppRoutes.moviedetailscreen)     ;                       
          },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                image: 
                isinit? storedMovie?.poster != null && storedMovie!.poster!.isNotEmpty?
                DecorationImage(image: NetworkImage(storedMovie!.poster!,), fit: BoxFit.cover) : null:
                movie?.poster != null &&
                        movie!.poster!.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(movie!.poster!),
                        fit: BoxFit.cover,
                      ) : null 
                    ,
                color: AppConfig.greyHint,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isinit?storedMovie?.title??"" :movie?.title ?? "",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: AppConfig.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            isinit?storedMovie?.year??"" :movie?.year ?? "",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppConfig.greyHint),
          ),
        ],
      ),
    );
  }
}
