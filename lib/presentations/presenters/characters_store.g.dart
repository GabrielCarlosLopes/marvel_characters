// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersStore on _CharactersStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CharactersStoreBase.isLoading', context: context);

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

  late final _$offSetAtom =
      Atom(name: '_CharactersStoreBase.offSet', context: context);

  @override
  int get offSet {
    _$offSetAtom.reportRead();
    return super.offSet;
  }

  @override
  set offSet(int value) {
    _$offSetAtom.reportWrite(value, super.offSet, () {
      super.offSet = value;
    });
  }

  late final _$charactersListAtom =
      Atom(name: '_CharactersStoreBase.charactersList', context: context);

  @override
  ObservableList<CharacterViewModel> get charactersList {
    _$charactersListAtom.reportRead();
    return super.charactersList;
  }

  @override
  set charactersList(ObservableList<CharacterViewModel> value) {
    _$charactersListAtom.reportWrite(value, super.charactersList, () {
      super.charactersList = value;
    });
  }

  late final _$fetchAsyncAction =
      AsyncAction('_CharactersStoreBase.fetch', context: context);

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
offSet: ${offSet},
charactersList: ${charactersList}
    ''';
  }
}
