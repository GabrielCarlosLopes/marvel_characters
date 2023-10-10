import 'package:go_router/go_router.dart';
import 'package:marvel_characters/ui/characters/characters_page.dart';
import 'package:marvel_characters/ui/characters_details/character_details_page.dart';
import 'package:marvel_characters/ui/splash/splash_page.dart';

import 'trannsition_fade.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    transitionFade(path: '/characters', child: const CharactersPage()),
    GoRoute(
      path: '/character_details/:characterId',
      builder: (context, state) =>
          CharacterDetailsPage(id: state.pathParameters['characterId']!),
    )
  ],
);
