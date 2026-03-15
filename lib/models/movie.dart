class Movie {
  final String title;
  final String poster;

  Movie({
    required this.title,
    required this.poster,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      poster: json['poster_path'] ?? '',
    );
  }
}