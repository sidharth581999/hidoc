part of 'movie_detail_bloc.dart';

@immutable
sealed class MovieDetailState {}

final class MovieDetailInitial extends MovieDetailState {}

final class MovieDetailBuildState extends MovieDetailState {
  final bool isLoading;
  final bool isError;
  final String? errorMsg;
  final MovieDetail? movie;

  MovieDetailBuildState({required this.isLoading, required this.isError, required this.movie, this.errorMsg});
}
