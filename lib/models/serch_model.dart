// To parse this JSON data, do
//
//     final SearchModel = SearchModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

SearchModel SearchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String SearchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
    List<SearchedMovie>? search;
    String? totalResults;
    String? response;

    SearchModel({
        this.search,
        this.totalResults,
        this.response,
    });

    factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        search: json["Search"] == null ? [] : List<SearchedMovie>.from(json["Search"]!.map((x) => SearchedMovie.fromJson(x))),
        totalResults: json["totalResults"],
        response: json["Response"],
    );

    Map<String, dynamic> toJson() => {
        "Search": search == null ? [] : List<dynamic>.from(search!.map((x) => x.toJson())),
        "totalResults": totalResults,
        "Response": response,
    };
}

class SearchedMovie {
    String? title;
    String? year;
    String? imdbId;
    Type? type;
    String? poster;

    SearchedMovie({
        this.title,
        this.year,
        this.imdbId,
        this.type,
        this.poster,
    });

    factory SearchedMovie.fromJson(Map<String, dynamic> json) => SearchedMovie(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: typeValues.map[json["Type"]]!,
        poster: json["Poster"],
    );

    Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": typeValues.reverse[type],
        "Poster": poster,
    };
}

enum Type {
    MOVIE,
    SERIES
}

final typeValues = EnumValues({
    "movie": Type.MOVIE,
    "series": Type.SERIES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
