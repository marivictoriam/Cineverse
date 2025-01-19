import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/widgets/movies/movie_poster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MovieMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  final bool infinityScroll;

  const MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage,
    required this.infinityScroll,
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    if (widget.infinityScroll) {
      //scrollController = ScrollController();

      scrollController.addListener(() {
        if (widget.loadNextPage == null) return;

        if ((scrollController.position.pixels + 100) >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 20),
                MoviePoster(movie: widget.movies[index]),
              ],
            );
          }

          return MoviePoster(movie: widget.movies[index]);
        },
      ),
    );
  }
}
