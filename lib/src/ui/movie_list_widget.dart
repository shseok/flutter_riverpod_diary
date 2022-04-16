import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prac/provider/movie_provider.dart';
import 'package:flutter_prac/src/model/movie.dart';
import 'package:provider/provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
            child: Image.network(movie.posterUrl)),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              Text(movie.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 10),
            Expanded(
                child: Text(movie.overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: TextStyle(fontSize: 13)),
              )
          ],
        ),
            ))
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
                child: _makeMovieOne(movies[index]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0,0),
                    )
                  ]
                ),
                height: 200,
              ),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: movies.length);
  }

  @override
  Widget build(BuildContext context) {
    // 전체가 업데이트 될 필요없이 builder안에서만 업데이트 되어야하므로
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();

    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Provider'),
        ),
        body: Consumer<MovieProvider>(
          builder: (context, provider, widgetChild) {
            if (provider.movies != null && provider.movies.length > 0) {
              return _makeListView(provider.movies);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
