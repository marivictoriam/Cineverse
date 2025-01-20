import 'package:cineverse/presentation/widgets/actors/actor_detail.dart';
import 'package:cineverse/presentation/blocs/blocs.dart';
import 'package:cineverse/presentation/widgets/shared/masonry.dart';
import 'package:cineverse/presentation/widgets/shared/custom_error.dart';
import 'package:cineverse/presentation/widgets/shared/screen_loader.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class ActorScreen extends StatefulWidget {
  final String actorId;

  const ActorScreen({super.key, required this.actorId});

  @override
  ActorScreenState createState() => ActorScreenState();
}

class ActorScreenState extends State<ActorScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    // Detalles del Actor
    context.read<ActorsDetailBloc>().add(LoadActor(widget.actorId));

    // Pelis del Actor
    context.read<ActorsMoviesBloc>().add(LoadMovie(widget.actorId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(body: BlocBuilder<ActorsDetailBloc, ActorsDetailState>(
        builder: (context, actorState) {
      final actor = actorState.actorsDetails[widget.actorId];

      if (actorState.isLoading) {
        return const ScreenLoader(
          isMain: false,
        );
      }

      if (actor == null) {
        return CustomError(
          errorMessage: "Ocurrio un error cargando la informacion del actor",
          onRetry: () {
            context.read<ActorsDetailBloc>().add(LoadActor(widget.actorId));
          },
        );
      }

      return Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ActorDetail(
                        actorImage: actor.profilePath,
                        actorName: actor.name,
                        actorBio: actor.biography!,
                      ),
                      FadeInUp(
                        child: Text(
                          "Filmografia",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: BlocBuilder<ActorsMoviesBloc, ActorsMoviesState>(
                          builder: (context, moviesState) {
                            if (moviesState.isLoading) {
                              return const Center(
                                  child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color.fromARGB(255, 26, 26, 26),
                                ),
                              ));
                            }

                            final movies =
                                moviesState.actorsMovies[widget.actorId] ?? [];

                            if (movies.isEmpty) {
                              return const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          size: 80,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "No se pudieron cargar las peliculas",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        )
                                      ]));
                            }
                            return Masonry(
                              list: movies,
                              infinityScroll: false,
                              isMovie: true,
                            );
                          },
                        ),
                      ),
                    ]),
              ),
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
    }));
  }

  @override
  bool get wantKeepAlive => true;
}
