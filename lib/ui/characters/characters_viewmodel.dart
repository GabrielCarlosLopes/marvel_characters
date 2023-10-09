import 'package:equatable/equatable.dart';

class CharacterViewModel extends Equatable {
  final int id;
  final String name;
  final String image;

  const CharacterViewModel(
      {required this.id, required this.name, required this.image});

  @override
  List get props => ['id', 'name', 'image'];
}
