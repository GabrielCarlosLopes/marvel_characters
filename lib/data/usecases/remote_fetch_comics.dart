import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/models/comic_model.dart';
import 'package:marvel_characters/domain/entities/comic_entity.dart';
import 'package:marvel_characters/domain/usecases/fetch_comics.dart';

import '../../domain/helpers/helpers.dart';

class RemoteFetchComics implements FetchComics {
  final HttpClient httpClient;

  RemoteFetchComics({
    required this.httpClient,
  });

  @override
  Future<List<ComicEntity>> fetch(url) async {
    try {
      final httpResponse =
          await httpClient.request<Map>(url: url, method: 'get');

      if (httpResponse['data'] == null ||
          httpResponse['data']['results'] == null) {
        throw DomainError.unexpected;
      }

      return (httpResponse['data']['results'] as List)
          .map((element) => ComicModel.fromJson(element).toEntity())
          .toList();
    } on HttpError {
      throw DomainError.unexpected;
    }
  }
}
