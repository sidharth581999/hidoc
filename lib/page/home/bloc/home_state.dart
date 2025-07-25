part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeBuildStae extends HomeState {
  final bool isLoading;
  final bool isError;
  final SearchModel? movies;
  final String? errorMsg;
  final bool isInit;
  final List<Search>? movieList;

  HomeBuildStae({required this.isLoading, required this.isError, required this.movies, this.errorMsg, required this.isInit, this.movieList});
}

// final class HomeBuildInitStae extends HomeState {
//   final bool isLoading;
//   final bool isError;
//   final List<Search>? movies;
//   final String? errorMsg;

//   HomeBuildInitStae({required this.isLoading, required this.isError, required this.movies, this.errorMsg});
// }

