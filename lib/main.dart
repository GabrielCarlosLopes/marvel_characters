import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:marvel_characters/data/usecases/usecases.dart';
import 'package:marvel_characters/infra/http/http.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';
import 'package:marvel_characters/presentations/routes/routes.dart';

GetIt getIt = GetIt.instance;

void main() {
  final httpClient =
      getIt.registerSingleton<HttpAdapter>(HttpAdapter(Client()));

  final remoteFetchCharacters = getIt.registerSingleton<RemoteFetchCharacters>(
    RemoteFetchCharacters(httpClient: httpClient),
  );

  final remoteFetchComic = getIt.registerSingleton<RemoteFetchComics>(
    RemoteFetchComics(httpClient: httpClient),
  );

  final remoteFetchCharacterDetails =
      getIt.registerSingleton<RemoteFetchCharactersDetails>(
    RemoteFetchCharactersDetails(httpClient: httpClient),
  );

  getIt.registerSingleton<CharactersStore>(
    CharactersStore(remoteFetchCharacters),
  );

  getIt.registerSingleton<CharacterDetailsStore>(
    CharacterDetailsStore(remoteFetchCharacterDetails, remoteFetchComic),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Marvel Characters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
