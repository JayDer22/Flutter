class Movie {
  String title;
  int year;
  String genre;

  Movie({
    required this.title,
    required this.year,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['year'],
      genre: json['genre'],
    );
  }
}
void main() {
  Map<String, dynamic> movieJson = {
    "title": "Inception",
    "year": 2010,
    "genre": "Science Fiction"
  };

  Movie movie = Movie.fromJson(movieJson);

  print("Title: ${movie.title}");
  print("Year: ${movie.year}");
  print("Genre: ${movie.genre}");
}
