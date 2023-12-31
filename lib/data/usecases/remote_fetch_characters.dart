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

      if (httpResponse['data'] == null ||
          httpResponse['data']['results'] == null ||
          (httpResponse['data']['results'] as List).isEmpty) {
        throw DomainError.unexpected;
      }

      return (httpResponse['data']['results'] as List)
          .map((element) => CharacterModel.fromJson(element).toEntity())
          .toList();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
