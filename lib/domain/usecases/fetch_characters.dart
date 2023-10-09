import '../entities/entities.dart';

abstract class FetchCharacters {
  Future<List<CharacterEntity>> fetch(String offSet, String url);
}
