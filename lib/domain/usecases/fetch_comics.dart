import 'package:marvel_characters/domain/entities/entities.dart';

abstract class FetchComics {
  Future<List<ComicEntity>> fetch(String url);
}
