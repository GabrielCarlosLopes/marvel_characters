// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:marvel_characters/data/http/http.dart';

class ComicModel {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final List<String> images;

  ComicModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.thumbnail,
      required this.images});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory ComicModel.fromMap(Map json) {
    if (!json.keys
        .toSet()
        .containsAll(['id', 'title', 'description', 'thumbnail', 'images'])) {
      throw HttpError.invalidData;
    }

    return ComicModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String,
      images: List<String>.from(
        (json['images'] as List<String>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ComicModel.fromJson(String source) =>
      ComicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
