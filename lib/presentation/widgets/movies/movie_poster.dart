import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/widgets/shared/background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';

class MoviePoster extends StatelessWidget {
  final Movie movie;

  const MoviePoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final random = Random();

    return FadeInUp(
      from: random.nextInt(100) + 30,
      delay: Duration(milliseconds: random.nextInt(450) + 0),
      child: GestureDetector(
        onTap: () => context.push('/movie/${movie.id}', extra: movie),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              FadeInImage(
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loader.jpg'),
                image: NetworkImage(movie.posterPath),
              ),
              Background(
                option: 1,
                stops: const [0.4, 0.75],
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${(movie.voteAverage * 10).toStringAsFixed(0)}% de rating"
                            .toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
