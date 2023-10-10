import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/domain/entities/comic_entity.dart';

class ComicModel {
  final int id;
  final String title;
  final String? description;
  final String thumbnail;

  ComicModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  factory ComicModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll([
      'id',
      'title',
      'description',
      'thumbnail',
    ])) {
      throw HttpError.invalidData;
    }

    return ComicModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      thumbnail:
          json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }

  ComicEntity toEntity() => ComicEntity(
        id: id,
        title: title,
        description: description,
        thumbnail: thumbnail,
      );
}
