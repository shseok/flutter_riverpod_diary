import 'dart:convert';
import 'package:flutter_prac/src/model/movie.dart';
import 'package:http/http.dart' as http;

class MovieRepository{
  var queryParam = {
  'api_key' : 'e53660c8d514f82e380184266aa42508',
  };
  Future<List<Movie>> loadMovies() async{
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular', queryParam);
    var response = await http.get(url);
    if(response.body == null){
      print('error: with get');
    }

    Map<String, dynamic> body = json.decode(response.body);
    print(body);
    if(body['results'] == null) {
      print('error: results empty');
    }

    List<dynamic> list = body['results'];
    return list.map<Movie>((item) => Movie.fromJson(item)).toList();

  }

}