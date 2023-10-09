import '../../data/http/http.dart';

import '../models/models.dart';

class CharacterDetailsModel {
  final int id;
  final String name;
  final String? description;
  final String image;
  final List<ComicModel> comics;

  CharacterDetailsModel({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.comics,
  });

  factory CharacterDetailsModel.fromJson(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'name', 'description', 'image', 'comics'])) {
      throw HttpError.invalidData;
    }
    return CharacterDetailsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description:
          json['description'] != null ? json['description'] as String : '',
      image: json['image'] as String,
      comics: List<ComicModel>.from(
        (json['comics'] as List<int>).map<ComicModel>(
          (x) => ComicModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
