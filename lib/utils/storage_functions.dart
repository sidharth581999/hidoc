// utils/search_converter.dart

import 'package:movie/models/serch_model.dart' as api;
import 'package:movie/models/hive_search.dart';

extension ToHiveSearch on api.SearchedMovie {
  Search toHiveSearch() {
    return Search(
      title: title,
      year: year,
      imdbId: imdbId,
      type: type?.name.toLowerCase(), // convert enum to string
      poster: poster,
    );
  }
}

extension ToApiSearch on Search {
  api.SearchedMovie toApiSearch() {
    return api.SearchedMovie(
      title: title,
      year: year,
      imdbId: imdbId,
      type: type != null ? api.typeValues.map[type!] : null,
      poster: poster,
    );
  }
}
