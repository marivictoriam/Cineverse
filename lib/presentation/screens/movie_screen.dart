import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/blocs/blocs.dart';
import 'package:cineverse/presentation/widgets/actors/actors_by_movie.dart';
import 'package:cineverse/presentation/widgets/shared/background.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  const MovieScreen({super.key, required this.movie});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends State<MovieScreen> {
  bool showDetails = false;

  @override
  void initState() {
    super.initState();
    final movie = widget.movie;
    context.read<MovieActorsBloc>().add(LoadMovieActors(movie.id.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (!showDetails) {
            setState(() {
              showDetails = !showDetails;
            });
          }
        },
        child: showDetails ? buildDetailsView() : buildPosterView(),
      ),
    );
  }

  Widget buildPosterView() {
    return Stack(
      children: [
        Center(
          child: FadeInImage.assetNetwork(
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            image: widget.movie.posterPath,
            placeholder: 'assets/loader.jpg',
            imageErrorBuilder: (context, error, stackTrace) {
              return SizedBox(
                  height: double.infinity,
                  child: Image.asset('assets/loader.jpg', fit: BoxFit.fill));
            },
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 136, 173, 253),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDetailsView() {
    return Stack(
      children: [
        FadeInImage.assetNetwork(
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
          image: widget.movie.posterPath,
          placeholder: 'assets/loader.jpg',
          imageErrorBuilder: (context, error, stackTrace) {
            return SizedBox(
                height: double.infinity,
                child: Image.asset('assets/loader.jpg', fit: BoxFit.fill));
          },
        ),
        FadeIn(
            duration: const Duration(milliseconds: 700),
            child: Stack(
              children: [
                Background(
                  option: 2,
                  stops: const [0.6, 0.1],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(),
                      Text(
                        widget.movie.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${(widget.movie.voteAverage * 10).toStringAsFixed(0)}% de rating",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ActorsByMovie(movieId: widget.movie.id.toString()),
                    ],
                  ),
                ),
              ],
            )),
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 136, 173, 253),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
