import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_movie_api/providers/movie_provider.dart';


class MovieScreen extends ConsumerWidget {

  final String query;

  const MovieScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final moviesAsync = ref.watch(movieSearchProvider(query));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
      ),

      body: moviesAsync.when(

        data: (movies) => ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {

            final movie = movies[index];

            return ListTile(
              title: Text(movie.title),
            );
          },
        ),

        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, _) => Center(
          child: Text("Error: $e"),
        ),
      ),
    );
  }
}