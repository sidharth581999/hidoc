import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/models/hive_search.dart';
import 'package:movie/models/serch_model.dart' show SearchModel;
import 'package:movie/services/movie_apis.dart';
import 'package:movie/storage/search_storage.dart';
import 'package:movie/utils/network_util.dart';
import 'package:movie/utils/storage_functions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<MovieSearchEvent>(movieSearchEvent);
    on<MovieSerchBuildInitEvent>(movieSerchBuildInitEvent);
  }

Future<void> movieSearchEvent(MovieSearchEvent event, Emitter<HomeState> emit) async {
  emit(HomeBuildStae(isLoading: true, isError: false, movies: null, isInit: false));

  bool isConnected = await NetworkHelper.hasNetwork();
  if (event.search.isNotEmpty) {
    if (isConnected) {
      final res = await MovieApis.getSerchMovies(event.search);
      await res.fold(
        (l) async {
          emit(HomeBuildStae(isLoading: false, isError: true, movies: null, isInit: false, errorMsg: l));
        },
        (r) async {
          if (r.search != null) {
            final hiveList = r.search!.map((e) => e.toHiveSearch()).toList();
            await SearchStorage.saveSearchList(hiveList);
          }
          emit(HomeBuildStae(isLoading: false, isError: false, movies: r, isInit: false));
        },
      );
    } else {
      emit(HomeBuildStae(isLoading: true, isError: false, movies: null, isInit: false));
    }
  } else {
    emit(HomeBuildStae(isLoading: false, isError: false, movies: null, isInit: false));
  }
}


  FutureOr<void> movieSerchBuildInitEvent(MovieSerchBuildInitEvent event, Emitter<HomeState> emit) async{
    emit(HomeBuildStae(isLoading: true, isError: false, movies: null, isInit: true));
    final lastModel = await SearchStorage.getLastSearchList();
    emit(HomeBuildStae(isLoading: false, isError: false, movies: null, isInit: true, movieList: lastModel));
  }
}
