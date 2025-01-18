import 'package:cineverse/config/app_router.dart';
import 'package:cineverse/config/app_theme.dart';
import 'package:cineverse/infraestructure/datasource/moviedb_actor_datasource.dart';
import 'package:cineverse/infraestructure/datasource/moviedb_movie_datasource.dart';
import 'package:cineverse/infraestructure/repositories/actors_repository_impl.dart';
import 'package:cineverse/infraestructure/repositories/movies_repository_impl.dart';
import 'package:cineverse/presentation/blocs/movie_actors_bloc.dart/movie_actors_bloc.dart';
import 'package:cineverse/presentation/blocs/movies_bloc/movies_bloc.dart';
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
        BlocProvider<ActorsBloc>(
          create: (context) => ActorsBloc(
              getActors: ActorRepositoryImpl(ActorMovieDbDatasource())
                  .getActorsByMovie),
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
