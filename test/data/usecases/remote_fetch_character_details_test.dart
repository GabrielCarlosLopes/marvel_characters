import 'package:faker/faker.dart';
import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/usecases/usecases.dart';
import 'package:marvel_characters/domain/entities/entities.dart';
import 'package:marvel_characters/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late RemoteFetchCharactersDetails sut;
  late HttpClientMock httpClient;
  late String url;
  late Map map;

  Map mockValidData() => {
        'data': {
          'results': [
            {
              'id': faker.randomGenerator.integer(1000),
              'name': faker.randomGenerator.string(100),
              'description': faker.randomGenerator.string(100),
              "thumbnail": {
                "path": faker.internet.httpUrl(),
                "extension": "jpg"
              },
            }
          ],
        },
      };

  setUp(() {
    httpClient = HttpClientMock();
    sut = RemoteFetchCharactersDetails(httpClient: httpClient);
    url = faker.internet.httpUrl();
    map = mockValidData();
  });

  test(
      'should throw a Domain Error.unexpected error if the response is invalid',
      () async {
    when(() => httpClient.request<Map>(url: url, method: 'get'))
        .thenAnswer((_) async => {'data': null});

    final future = sut.fetch(url);

    expect(future, throwsA(DomainError.unexpected));
  });

  test('should map the response data to an entity', () async {
    when(() => httpClient.request<Map>(url: url, method: 'get'))
        .thenAnswer((_) async => map);

    final characterDetailsEntity = await sut.fetch(url);

    expect(
      characterDetailsEntity,
      CharacterDetailsEntity(
          id: map['data']['results'][0]['id'],
          name: map['data']['results'][0]['name'],
          description: map['data']['results'][0]['description'],
          image:
              '${map['data']['results'][0]['path']}.${map['data']['results'][0]['extension']}',
          comics: null),
    );
  });

  test('should throw a Domain Error.unexpected error if there is an error',
      () async {
    when(() => httpClient.request<Map>(url: url, method: 'get'))
        .thenThrow(HttpError.serverError);

    final future = sut.fetch(url);

    expect(future, throwsA(DomainError.unexpected));
  });
}
