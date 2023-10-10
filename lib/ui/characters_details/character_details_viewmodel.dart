import 'package:equatable/equatable.dart';
import 'package:marvel_characters/ui/characters_details/comic_viewmodel.dart';

class CharacterDetailsViewModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String image;
  final List<ComicViewModel>? comics;

  const CharacterDetailsViewModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.comics,
  });

  @override
  List get props => ['id', 'name', 'description', 'image', 'comics'];
}
