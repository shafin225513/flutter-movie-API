import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie.dart';

class MovieService {

  final String apiKey = "2ed5bdb0f67fb9d975360bbca70b513b";

  Future<List<Movie>> searchMovies(String query) async {

    final url =
        "https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      final data = json.decode(response.body);

      List results = data['results'];

      return results.map((m) => Movie.fromJson(m)).toList();

    } else {
      throw Exception("API failed");
    }
  }
}