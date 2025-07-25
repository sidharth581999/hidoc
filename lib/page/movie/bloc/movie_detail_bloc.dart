import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/models/moviedetail_model.dart';
import 'package:movie/services/movie_apis.dart';
import 'package:movie/utils/network_util.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieTileClickedEvent>(movieTileClickedEvent);
  }

  FutureOr<void> movieTileClickedEvent(MovieTileClickedEvent event, Emitter<MovieDetailState> emit) async{
    emit(MovieDetailBuildState(isLoading: true, isError: false, movie: null));
    bool isConnected = await NetworkHelper.hasNetwork();
    if (isConnected) {
      final res = await MovieApis.getCompleteMovieDetails(event.movieName);
      res.fold((l){
        emit(MovieDetailBuildState(isLoading: false, isError: true, movie: null, errorMsg: l));
      }, (r){
        emit(MovieDetailBuildState(isLoading: false, isError: false, movie: r));
      });
    } else {
      emit(MovieDetailBuildState(isLoading: false, isError: true, movie: null, errorMsg: "No network"));
    }
  }
}
