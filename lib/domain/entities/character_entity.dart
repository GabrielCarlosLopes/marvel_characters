import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int id;
  final String name;
  final String image;

  const CharacterEntity(
      {required this.id, required this.name, required this.image});

  @override
  List get props => ['id', 'name', 'image'];
}
