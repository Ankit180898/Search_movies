import 'dart:convert';

import 'package:http/http.dart' as http;

import 'movie_model.dart';

class WebService{

  Future<List<Movie>> fetchMovie(String keyword) async{
    final url="http://www.omdbapi.com/?s=$keyword&apikey=cfaffd1b";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        final body=jsonDecode(response.body);
        final Iterable json=body["Search"];
        return json.map((movie) => Movie.fromJson(movie) ).toList();

      }
    else{
      throw Exception("Unable to perform request!");
    }
  }

}