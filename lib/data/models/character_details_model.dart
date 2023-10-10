import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/models/models.dart';
import 'package:marvel_characters/domain/entities/character_details_entity.dart';

class CharacterDetailsModel {
  final int id;
  final String name;
  final String? description;
  final String image;
  final List<ComicModel>? comics;

  CharacterDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.comics,
  });
  factory CharacterDetailsModel.fromJson(Map json) {
    if (!json.keys.toSet().containsAll(
      ['id', 'name', 'description', 'thumbnail'],
    )) {
      throw HttpError.invalidData;
    }
    return CharacterDetailsModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      image: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      comics: [],
    );
  }

  CharacterDetailsEntity toEntity() => CharacterDetailsEntity(
        id: id,
        name: name,
        description: description,
        image: image,
        comics: const [],
      );
}
