import 'package:hive/hive.dart';

part 'hive_search.g.dart';

@HiveType(typeId: 1)
class Search extends HiveObject {
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? year;

  @HiveField(2)
  String? imdbId;

  @HiveField(3)
  String? type;

  @HiveField(4)
  String? poster;

  Search({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        title: json["Title"],
        year: json["Year"],
        imdbId: json["imdbID"],
        type: json["Type"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}
