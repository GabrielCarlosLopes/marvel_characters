import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';
import 'package:marvel_characters/ui/characters/components/components.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final _store = GetIt.I<CharactersStore>();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _store.fetch();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Quando o usuário chegar ao final da lista, carregue mais itens
        _store.fetch();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          )),
      body: Observer(
        builder: (_) {
          if (_store.isLoading && _store.charactersList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListCharactersWidget(
            scrollController: scrollController,
            list: _store.charactersList,
            store: _store,
          );
        },
      ),
    );
  }
}
