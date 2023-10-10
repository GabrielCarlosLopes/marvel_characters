import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marvel_characters/presentations/presenters/presenters.dart';
import 'package:marvel_characters/ui/characters/characters_viewmodel.dart';
import 'package:marvel_characters/ui/characters/components/components.dart';

class ListCharactersWidget extends StatelessWidget {
  const ListCharactersWidget({
    super.key,
    required this.scrollController,
    required this.list,
    required this.store,
  });

  final ScrollController scrollController;
  final List<CharacterViewModel> list;
  final CharactersStore store;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      itemCount: list.length + 1,
      itemBuilder: (context, index) {
        if (index < list.length) {
          return InkWell(
            onTap: () => context.push(
              '/character_details/${list[index].id}',
            ),
            borderRadius: BorderRadius.circular(50),
            child: Padding(
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
                        child: ImageCharacterWidget(
                            characterImage: list[index].image),
                      ),
                    ),
                    CharacterNameWidget(characterName: list[index].name),
                  ],
                ),
              ),
            ),
          );
        } else if (store.isLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      },
    );
  }
}
