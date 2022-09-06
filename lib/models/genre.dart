
import 'dart:convert';

class Genre {

  int? id;
  String? name;

  Genre({
    this.id,this.name
});

  factory Genre.fromJson(Map<String , dynamic> json)=>Genre(

    id: json["id"],
    name: json["name"],

  );

  Map<String,dynamic> toJson() => {
    "id":id,
    "name": name,

  };
}
List<Genre> genreFromJson (String str) => List<Genre>.from(json.decode(str)["genres"].map((x)=>Genre.fromJson(x)));
String genretoJson (List<Genre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));