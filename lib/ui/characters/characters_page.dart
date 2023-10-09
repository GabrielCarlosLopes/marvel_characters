import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';

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
        title: const Text(
          'Personagens da MARVEL',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_store.isLoading && _store.charactersList.isEmpty) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: _store.charactersList.length +
                1, // +1 para o indicador de carregamento
            itemBuilder: (context, index) {
              if (index < _store.charactersList.length) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 350,
                    width: 350,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            surfaceTintColor: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: CachedNetworkImage(
                                imageUrl: _store.charactersList[index].image,
                                placeholder: (context, url) => const Center(
                                    child:
                                        CircularProgressIndicator.adaptive()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                                imageBuilder: (context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(44),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          child: Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            width: 155,
                            height: 40,
                            child: Row(
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      _store.charactersList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (_store.isLoading) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                return const SizedBox(
                  height: 50,
                ); // Espaço vazio para o indicador de carregamento
              }
            },
          );
        },
      ),
    );
  }
}
