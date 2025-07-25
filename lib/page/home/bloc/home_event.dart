part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class MovieSerchBuildInitEvent extends HomeEvent {}

class MovieSearchEvent extends HomeEvent {
  final String search;

  MovieSearchEvent({required this.search});
}

