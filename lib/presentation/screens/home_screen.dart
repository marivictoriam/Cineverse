import 'package:cineverse/presentation/blocs/blocs.dart';
import 'package:cineverse/presentation/widgets/shared/custom_drawer.dart';
import 'package:cineverse/presentation/widgets/shared/masonry.dart';
import 'package:cineverse/presentation/widgets/shared/custom_error.dart';
import 'package:cineverse/presentation/widgets/shared/screen_loader.dart';
import 'package:cineverse/presentation/widgets/shared/custom_app_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
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
          preferredSize: Size.fromHeight(100),
          child: CustomAppbar(subtitle: "Peliculas Populares"),
        ),
        drawer: const CustomDrawer(),
        body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
          if (state.isLoading && state.movies.isEmpty) {
            return const ScreenLoader(
              isMain: true,
            );
          }

          if (state.movies.isEmpty) {
            return CustomError(
              errorMessage: "Ocurrio un error cargando las peliculas",
              onRetry: () {
                context.read<MoviesBloc>().add(LoadNextPage());
              },
            );
          }

          return Masonry(
            list: state.movies,
            loadNextPage: () => context.read<MoviesBloc>().add(LoadNextPage()),
            infinityScroll: true,
            isMovie: true,
          );
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
