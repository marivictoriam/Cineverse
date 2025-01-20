import 'package:cineverse/config/app_router.dart';
import 'package:cineverse/config/app_theme.dart';
import 'package:cineverse/infraestructure/datasource/datasources.dart';
import 'package:cineverse/infraestructure/repositories/repositories.dart';
import 'package:cineverse/presentation/blocs/blocs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (context) => MoviesBloc(
              fetchMoreMovies:
                  MovieRepositoryImpl(MoviedbDatasource()).getPopular),
        ),
        BlocProvider<MovieActorsBloc>(
          create: (context) => MovieActorsBloc(
              getActors: ActorRepositoryImpl(ActorMovieDbDatasource())
                  .getActorsByMovie),
        ),
        BlocProvider<ActorsDetailBloc>(
          create: (context) => ActorsDetailBloc(
              getActor:
                  ActorRepositoryImpl(ActorMovieDbDatasource()).getActorDetail),
        ),
        BlocProvider<ActorsMoviesBloc>(
          create: (context) => ActorsMoviesBloc(
              getActorsMovies:
                  MovieRepositoryImpl(MoviedbDatasource()).getMoviesByActor),
        ),
        BlocProvider<ActorsBloc>(
          create: (context) => ActorsBloc(
              fetchMoreActors:
                  ActorRepositoryImpl(ActorMovieDbDatasource()).getPopular),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        routerConfig: appRouter,
      ),
    );
  }
}
