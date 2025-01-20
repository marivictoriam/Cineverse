import 'package:cineverse/presentation/blocs/blocs.dart';
import 'package:cineverse/presentation/widgets/shared/custom_drawer.dart';
import 'package:cineverse/presentation/widgets/shared/masonry.dart';
import 'package:cineverse/presentation/widgets/shared/custom_error.dart';
import 'package:cineverse/presentation/widgets/shared/screen_loader.dart';
import 'package:cineverse/presentation/widgets/shared/custom_app_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ActorsScreen extends StatefulWidget {
  const ActorsScreen({super.key});

  @override
  ActorsScreenState createState() => ActorsScreenState();
}

class ActorsScreenState extends State<ActorsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    context.read<ActorsBloc>().add(LoadANextPage());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: CustomAppbar(
            subtitle: "Actores Populares",
          ),
        ),
        drawer: const CustomDrawer(),
        body: BlocBuilder<ActorsBloc, ActorsState>(builder: (context, state) {
          if (state.isLoading && state.actors.isEmpty) {
            return const ScreenLoader();
          }

          if (state.actors.isEmpty) {
            return CustomError(
              errorMessage: "Ocurrio un error cargando las peliculas",
              onRetry: () {
                context.read<ActorsBloc>().add(LoadANextPage());
              },
            );
          }

          return Masonry(
            list: state.actors,
            loadNextPage: () => context.read<ActorsBloc>().add(LoadANextPage()),
            infinityScroll: true,
            isMovie: false,
          );
        }));
  }

  @override
  bool get wantKeepAlive => true;
}
