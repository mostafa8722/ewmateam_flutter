
import 'dart:core';
import 'dart:convert';









class Film{

  int? id;
  bool? adult;
  String? backdrop_path;
  List<dynamic>? genre_ids;
  Object? belongs_to_collection;
  List<dynamic>? genres;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  double? budget;
  double? revenue;
  double? runtime;
  String? title;
  bool? video;
  double? vote_average;
  double? vote_count;

  Film({
    this. id,
    this. adult,
    this. backdrop_path,
    this. genre_ids,
    this. belongs_to_collection,
    this. original_language,
    this. original_title,
    this. overview,
    this. popularity,
    this. poster_path,
    this. release_date,
    this. title,
    this. video,
    this. vote_average,
    this. vote_count,
    this. revenue,
    this. budget,
    this. runtime,
    this. genres,
});

factory Film.fromJson(Map<String , dynamic> json1)=>Film(

   id: json1["id"],
   adult: json1["adult"],
   backdrop_path: json1["backdrop_path"],
   genre_ids: json1["genre_ids"],
   original_language: json1["original_language"],
   original_title: json1["original_title"],
   overview: json1["overview"],
   popularity: json1["popularity"],
  belongs_to_collection:(json1["belongs_to_collection"]),
   poster_path: json1["poster_path"],
   release_date: json1["release_date"],
   title: json1["title"],
   video: json1["video"],
   vote_average: json1["vote_average"],
   vote_count: json1["vote_count"],
  revenue: json1["revenue"],
  budget: json1["budget"],
  runtime: json1["runtime"],
  genres: json1["genres"],
);

Map<String,dynamic> toJson() => {
  "id":id,
  "adult": adult,
  "backdrop_path": backdrop_path,
  "genre_ids": genre_ids,
  "original_language": original_language,
  "original_title": original_title,
  "overview": overview,
  "belongs_to_collection": belongs_to_collection,
  "popularity": popularity,
  "poster_path": poster_path,
  "release_date": release_date,
  "title": title,
  "video": video,
  "vote_average": vote_average,
  "vote_count": vote_count,
  "budget": budget,
  "revenue": revenue,
  "runtime": runtime,
  "genres": genres,
};
}
List<Film> filmFromJson (String str) => List<Film>.from(json.decode(str)["results"].map((x)=>Film.fromJson(x)));
Film  filmJson (String str) => Film.fromJson(json.decode(str));
String filmtoJson (List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Poster {
  int? id;
  String? poster_path;
  Poster({
    this.id,
    this.poster_path
});

}