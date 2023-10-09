// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:marvel_characters/domain/helpers/helpers.dart';
import 'package:marvel_characters/domain/usecases/usecases.dart';
import 'package:marvel_characters/ui/ui.dart';
import 'package:mobx/mobx.dart';
part 'characters_store.g.dart';

class CharactersStore = _CharactersStoreBase with _$CharactersStore;

abstract class _CharactersStoreBase with Store {
  final FetchCharacters fetchCharacters;

  _CharactersStoreBase(this.fetchCharacters);

  @observable
  bool isLoading = false;

  @observable
  int offSet = 0;

  @observable
  ObservableList<CharacterViewModel> charactersList =
      ObservableList<CharacterViewModel>();

  @action
  Future<void> fetch() async {
    try {
      isLoading = true;
      final characters = await fetchCharacters.fetch(
        offSet.toString(),
        generateUrl(offSet.toString(), 'characters'),
      );

      for (var e in characters) {
        charactersList
            .add(CharacterViewModel(id: e.id, name: e.name, image: e.image));
      }

      offSet += 20;
      isLoading = false;
    } on DomainError catch (error) {
      log(error.name);
    } finally {
      isLoading = false;
    }
  }
}
