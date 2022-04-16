import 'package:flutter/material.dart';
import 'package:flutter_prac/src/repository/movie_repository.dart';
import '../src/model/movie.dart';

class MovieProvider extends ChangeNotifier{
  MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  loadMovies() async{
    // repository
    List<Movie> listMovies = await _movieRepository.loadMovies();
    //_movies를 listMovies자리에 넣어도 되지만 예외처리를 해주고 추가적인 가공절차를 위해 listMovies를 업데이트한다. (지금은 skip)
    _movies = listMovies;
    notifyListeners(); // MoviePRovider를 구독하고 있는 모든 위젯에 알려줌
  }
}