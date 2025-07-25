part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailEvent {}

class MovieTileClickedEvent extends MovieDetailEvent {
  final String movieName;

  MovieTileClickedEvent({required this.movieName});
}