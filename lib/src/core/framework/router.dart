import 'package:go_router/go_router.dart';
import 'package:kings_league_app/src/presentation/pages/pages.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const HomePage(),
    ),
    GoRoute(
      path: '/team/:id',
      builder: (_, state) => TeamPage(
        id: state.params['id']!,
      ),
    ),
  ],
  //errorBuilder: (_, state) => const ErrorPage(),
);
