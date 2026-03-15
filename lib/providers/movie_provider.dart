import 'package:flutter_application_movie_api/models/movie.dart';
import 'package:flutter_application_movie_api/services/api_service.dart';
import 'package:riverpod/riverpod.dart';

final movieServiceProvider = Provider((ref) => MovieService());

final movieSearchProvider =
    FutureProvider.family<List<Movie>, String>((ref, query) {

  final service = ref.watch(movieServiceProvider);

  return service.searchMovies(query);
});