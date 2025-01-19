import 'package:cineverse/presentation/blocs/movies_bloc/movies_state.dart';
import 'package:cineverse/presentation/widgets/movies/movie_masonry.dart';
import 'package:cineverse/presentation/widgets/shared/custom_error.dart';
import 'package:cineverse/presentation/widgets/shared/screen_loader.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cineverse/presentation/blocs/movies_bloc/movies_bloc.dart';
import 'package:cineverse/presentation/blocs/movies_bloc/movies_event.dart';
import 'package:cineverse/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<MoviesBloc>().add(LoadNextPage());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: CustomAppbar(),
        ),
        body: BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, moviesState) {
          if (moviesState.isLoading) {
            return const ScreenLoader();
          }

          if (moviesState.movies.isEmpty) {
            return CustomError(
              errorMessage: "Ocurrio un error cargando las peliculas",
              onRetry: () {
                context.read<MoviesBloc>().add(LoadNextPage());
              },
            );
          }

          return MovieMasonry(
            movies: moviesState.movies,
            loadNextPage: () => context.read<MoviesBloc>().add(LoadNextPage()),
            infinityScroll: true,
          );
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
