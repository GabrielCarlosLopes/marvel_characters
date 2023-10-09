import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/models/models.dart';
import 'package:marvel_characters/domain/entities/entities.dart';
import 'package:marvel_characters/domain/usecases/fetch_characters.dart';

import '../../domain/helpers/helpers.dart';

class RemoteFetchCharacters implements FetchCharacters {
  final HttpClient httpClient;

  RemoteFetchCharacters({
    required this.httpClient,
  });

  @override
  Future<List<CharacterEntity>> fetch(offSet, url) async {
    try {
      final httpResponse =
          await httpClient.request<Map>(url: url, method: 'get');

      List<CharacterEntity> list = [];

      for (var element in httpResponse['data']['results']) {
        list.add(CharacterModel.fromJson(element).toEntity());
      }

      return list;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
