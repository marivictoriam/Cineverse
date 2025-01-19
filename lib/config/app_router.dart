import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/screens/actor_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:cineverse/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    name: "home-screen",
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: '/movie/:id',
    name: 'movie-screen',
    builder: (context, state) {
      final movie = state.extra as Movie;
      return MovieScreen(movie: movie);
    },
  ),
  GoRoute(
    path: '/actor/:id',
    name: 'actor-screen',
    builder: (context, state) {
      final actorId = state.pathParameters['id'] ?? 'no-id';
      return ActorScreen(actorId: actorId);
    },
  ),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home',
  ),
]);
