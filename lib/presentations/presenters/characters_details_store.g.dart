// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharacterDetailsStore on _CharacterDetailsStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CharacterDetailsStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$comicsListAtom =
      Atom(name: '_CharacterDetailsStoreBase.comicsList', context: context);

  @override
  ObservableList<ComicViewModel>? get comicsList {
    _$comicsListAtom.reportRead();
    return super.comicsList;
  }

  @override
  set comicsList(ObservableList<ComicViewModel>? value) {
    _$comicsListAtom.reportWrite(value, super.comicsList, () {
      super.comicsList = value;
    });
  }

  late final _$characterDetailsAtom = Atom(
      name: '_CharacterDetailsStoreBase.characterDetails', context: context);

  @override
  CharacterDetailsViewModel? get characterDetails {
    _$characterDetailsAtom.reportRead();
    return super.characterDetails;
  }

  @override
  set characterDetails(CharacterDetailsViewModel? value) {
    _$characterDetailsAtom.reportWrite(value, super.characterDetails, () {
      super.characterDetails = value;
    });
  }

  late final _$displayErrorAtom =
      Atom(name: '_CharacterDetailsStoreBase.displayError', context: context);

  @override
  bool get displayError {
    _$displayErrorAtom.reportRead();
    return super.displayError;
  }

  @override
  set displayError(bool value) {
    _$displayErrorAtom.reportWrite(value, super.displayError, () {
      super.displayError = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_CharacterDetailsStoreBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$fetchComicAsyncAction =
      AsyncAction('_CharacterDetailsStoreBase.fetchComic', context: context);

  @override
  Future<void> fetchComic(String id) {
    return _$fetchComicAsyncAction.run(() => super.fetchComic(id));
  }

  late final _$fetchCharacterDetailsAsyncAction = AsyncAction(
      '_CharacterDetailsStoreBase.fetchCharacterDetails',
      context: context);

  @override
  Future<void> fetchCharacterDetails(String id) {
    return _$fetchCharacterDetailsAsyncAction
        .run(() => super.fetchCharacterDetails(id));
  }

  late final _$fetchAllAsyncAction =
      AsyncAction('_CharacterDetailsStoreBase.fetchAll', context: context);

  @override
  Future<void> fetchAll(String id) {
    return _$fetchAllAsyncAction.run(() => super.fetchAll(id));
  }

  late final _$_CharacterDetailsStoreBaseActionController =
      ActionController(name: '_CharacterDetailsStoreBase', context: context);

  @override
  dynamic setDisplayError(bool value) {
    final _$actionInfo = _$_CharacterDetailsStoreBaseActionController
        .startAction(name: '_CharacterDetailsStoreBase.setDisplayError');
    try {
      return super.setDisplayError(value);
    } finally {
      _$_CharacterDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setErrorText(String text) {
    final _$actionInfo = _$_CharacterDetailsStoreBaseActionController
        .startAction(name: '_CharacterDetailsStoreBase.setErrorText');
    try {
      return super.setErrorText(text);
    } finally {
      _$_CharacterDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetError() {
    final _$actionInfo = _$_CharacterDetailsStoreBaseActionController
        .startAction(name: '_CharacterDetailsStoreBase.resetError');
    try {
      return super.resetError();
    } finally {
      _$_CharacterDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo = _$_CharacterDetailsStoreBaseActionController
        .startAction(name: '_CharacterDetailsStoreBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$_CharacterDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
comicsList: ${comicsList},
characterDetails: ${characterDetails},
displayError: ${displayError},
errorText: ${errorText}
    ''';
  }
}
