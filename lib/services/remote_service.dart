import 'dart:convert';

import 'package:ewmateam/models/cast.dart';
import 'package:ewmateam/models/film.dart';
import 'package:ewmateam/models/genre.dart';
import 'package:http/http.dart' as http;




class RemoteServices {
  static var client = http.Client();

  static Future<List<Film>> fetchFilms() async {

    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=f62f750b70a8ef11dad44670cfb6aa57'));


    if (response.statusCode == 200) {
      var jsonString = response.body;


      return filmFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return filmFromJson(jsonString);
    }
  }

  static Future<Film> fetchFilm(id) async {

    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${id}?api_key=f62f750b70a8ef11dad44670cfb6aa57'));

    if (response.statusCode == 200) {
      var jsonString = response.body;


      return filmJson(jsonString);
    } else {

      var jsonString = response.body;
      return filmJson(jsonString);
    }
  }

  static Future<List<Cast>> fetchCredits(id) async {

    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${id}/credits?api_key=f62f750b70a8ef11dad44670cfb6aa57'));

    if (response.statusCode == 200) {
      var jsonString = response.body;





      return castFromJson(jsonString);
    } else {

      var jsonString = response.body;
      return castFromJson(jsonString);
    }
  }

  static Future<List<Genre>> fetchGenre() async {
    var response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=f62f750b70a8ef11dad44670cfb6aa57'));


    if (response.statusCode == 200) {
      var jsonString = response.body;

      return genreFromJson(jsonString);
    } else {
      var jsonString = response.body;
      return genreFromJson(jsonString);
    }
  }
}