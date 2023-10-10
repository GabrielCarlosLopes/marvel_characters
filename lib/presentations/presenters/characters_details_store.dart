// ignore_for_file: library_private_types_in_public_api

import 'package:marvel_characters/domain/usecases/usecases.dart';
import 'package:marvel_characters/ui/characters_details/character_details.dart';
import 'package:mobx/mobx.dart';

import '../../domain/helpers/helpers.dart';
part 'characters_details_store.g.dart';

class CharacterDetailsStore = _CharacterDetailsStoreBase
    with _$CharacterDetailsStore;

abstract class _CharacterDetailsStoreBase with Store {
  final FetchComics fetchComics;
  final FetchCharactersDetails fetchCharactersDetails;

  _CharacterDetailsStoreBase(this.fetchCharactersDetails, this.fetchComics);

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ComicViewModel>? comicsList;

  @observable
  CharacterDetailsViewModel? characterDetails;

  @observable
  bool displayError = false;

  @observable
  String? errorText;

  @action
  setDisplayError(bool value) => displayError = value;

  @action
  setErrorText(String text) => errorText = text;

  @action
  resetError() => displayError = false;

  @action
  Future<void> fetchComic(String id) async {
    try {
      final comics = await fetchComics.fetch(
        generateUrl('0', 'characters/$id/comics'),
      );

      if (comics.isNotEmpty) {
        comicsList = ObservableList<ComicViewModel>();
        for (var e in comics) {
          comicsList!.add(
            ComicViewModel(
              id: e.id,
              title: e.title,
              description: e.description ?? '',
              thumbnail: e.thumbnail,
            ),
          );
        }
      }
    } on DomainError {
      setDisplayError(true);
      setErrorText(
          'Um erro inesperado aconteceu, tente novamente em instantes');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchCharacterDetails(String id) async {
    try {
      final characterDetailsResponse = await fetchCharactersDetails.fetch(
        generateUrl('0', 'characters/$id'),
      );

      final character = CharacterDetailsViewModel(
        id: characterDetailsResponse.id,
        name: characterDetailsResponse.name,
        description: characterDetailsResponse.description ?? '',
        image: characterDetailsResponse.image,
        comics: comicsList,
      );

      characterDetails = character;
    } on DomainError {
      setDisplayError(true);
      setErrorText(
          'Um erro inesperado aconteceu, tente novamente em instantes');
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchAll(String id) async {
    try {
      isLoading = true;
      await fetchComic(id);
      await fetchCharacterDetails(id);
      isLoading = false;
    } on DomainError {
      setDisplayError(true);
      setErrorText(
          'Um erro inesperado aconteceu, tente novamente em instantes');
    } finally {
      isLoading = false;
    }
  }

  @action
  void dispose() {
    characterDetails = null;
    comicsList = null;
  }
}
