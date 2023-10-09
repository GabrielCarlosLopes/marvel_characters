import '../../domain/entities/entities.dart';

class CharacterDetailsEntity {
  final int id;
  final String name;
  final String? description;
  final String image;
  final List<ComicEntity> comics;

  CharacterDetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.comics,
  });
}
