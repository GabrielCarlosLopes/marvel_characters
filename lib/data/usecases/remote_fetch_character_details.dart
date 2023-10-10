import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/models/character_details_model.dart';
import 'package:marvel_characters/domain/entities/character_details_entity.dart';
import 'package:marvel_characters/domain/usecases/fetch_character_details.dart';

import '../../domain/helpers/helpers.dart';

class RemoteFetchCharactersDetails implements FetchCharactersDetails {
  final HttpClient httpClient;

  RemoteFetchCharactersDetails({
    required this.httpClient,
  });

  @override
  Future<CharacterDetailsEntity> fetch(url) async {
    try {
      final httpResponse =
          await httpClient.request<Map>(url: url, method: 'get');

      if (httpResponse['data'] == null ||
          httpResponse['data']['results'] == null ||
          (httpResponse['data']['results'][0]).isEmpty) {
        throw DomainError.unexpected;
      }

      return (httpResponse['data']['results'] as List)
          .map((element) => CharacterDetailsModel.fromJson(element).toEntity())
          .first;
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
