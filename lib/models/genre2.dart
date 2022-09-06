
import 'dart:convert';

class Genre {


  String? name;

  Genre({
this.name
});

  factory Genre.fromJson(Map<String , dynamic> json)=>Genre(


    name: json["name"],

  );

  Map<String,dynamic> toJson() => {

    "name": name,

  };
}
List<Genre> genreFromJson (String str) => List<Genre>.from(json.decode(str).map((x)=>Genre.fromJson(x)));
String genretoJson (List<Genre> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));