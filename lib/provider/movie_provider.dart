import 'package:flutter/material.dart';
import '../src/model/movie.dart';

class MovieProvider extends ChangeNotifier{
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;
  loadMovies(){
    // repository
  }
}