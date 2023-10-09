class ComicEntity {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final List<String> images;

  ComicEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.images,
  });
}
