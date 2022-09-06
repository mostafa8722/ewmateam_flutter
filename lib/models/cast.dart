
import 'dart:convert';

class Cast {

  int? id;
  String? name;

  Cast({
    this.id,this.name
});

  factory Cast.fromJson(Map<String , dynamic> json)=>Cast(

    id: json["id"],
    name: json["name"],

  );

  Map<String,dynamic> toJson() => {
    "id":id,
    "name": name,

  };
}
List<Cast> castFromJson (String str) => List<Cast>.from(json.decode(str)["cast"].map((x)=>Cast.fromJson(x)));
String casttoJson (List<Cast> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));