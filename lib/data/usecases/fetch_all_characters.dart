import '../entities/entities.dart';

abstract class FetchAllCharacters {
  Future<List<CharacterEntity>> fetch({int offSet});
}
