import 'package:equatable/equatable.dart';

import '../../domain/entities/entities.dart';

class CharacterDetailsEntity extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String image;
  final List<ComicEntity>? comics;

  const CharacterDetailsEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.comics,
  });

  @override
  List get props => ['id', 'name', 'description', 'image', 'comics'];
}
