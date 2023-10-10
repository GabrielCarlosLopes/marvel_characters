import 'package:marvel_characters/domain/entities/entities.dart';

abstract class FetchCharactersDetails {
  Future<CharacterDetailsEntity> fetch(String url);
}
