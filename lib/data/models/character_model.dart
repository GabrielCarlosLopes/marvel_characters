import 'package:marvel_characters/domain/entities/entities.dart';

import '../http/http_error.dart';

class CharacterModel {
  final int id;
  final String name;
  final String image;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CharacterModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(['id', 'name', 'thumbnail'])) {
      throw HttpError.invalidData;
    }

    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
    );
  }

  CharacterEntity toEntity() =>
      CharacterEntity(id: id, name: name, image: image);
}
