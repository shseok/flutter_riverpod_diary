class Movie{
  String title;
  String overview;
  String posterPath;

  Movie({required this.title, required this.overview, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String,
      title: json['title'] as String
    );
  }
}