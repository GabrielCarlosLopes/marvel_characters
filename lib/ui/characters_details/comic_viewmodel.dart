import 'package:equatable/equatable.dart';

class ComicViewModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  const ComicViewModel({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
  });

  @override
  List get props => [
        'id',
        'title',
        'description',
        'thumbnail',
      ];
}
