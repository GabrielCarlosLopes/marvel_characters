import 'package:faker/faker.dart';
import 'package:marvel_characters/data/usecases/usecases.dart';
import 'package:marvel_characters/domain/entities/entities.dart';
import 'package:marvel_characters/domain/helpers/helpers.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:marvel_characters/data/http/http.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  late RemoteFetchCharacters sut;
  late HttpClientSpy httpClient;
  late String path;
  late String url;
  late String offSet;
  late Map map;

  Map mockValidData() => {
        'data': {
          'results': [
            {
              'id': faker.guid.random.integer(1000),
              'name': faker.randomGenerator.string(50),
              "thumbnail": {
                "path": faker.internet.httpUrl(),
                "extension": "jpg"
              },
            },
            {
              'id': faker.guid.random.integer(1000),
              'name': faker.randomGenerator.string(50),
              "thumbnail": {
                "path": faker.internet.httpUrl(),
                "extension": "jpg"
              },
            }
          ]
        }
      };

  mockRequest() => when(() => httpClient.request<Map>(
        url: any(named: 'url'),
        method: 'get',
      ));

  void mockHttpData(Map data) {
    mockRequest().thenAnswer((_) async => data);
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  setUp(() async {
    path = faker.randomGenerator.string(10);
    offSet = faker.randomGenerator.integer(20, min: 20).toString();
    url = generateUrl(offSet, path);
    httpClient = HttpClientSpy();
    sut = RemoteFetchCharacters(
      httpClient: httpClient,
    );
    map = mockValidData();
    mockHttpData(map);
  });

  // Limpeza após cada teste
  tearDown(() {
    reset(httpClient);
  });

  test('Should call fetch with correct values', () async {
    await sut.fetch(offSet, url);

    verify(() => httpClient.request<Map>(url: url, method: 'get')).called(1);
  });

  test('should call fetch and return a list of characters entity', () async {
    final characters = await sut.fetch(offSet, url);

    expect(characters, [
      CharacterEntity(
        id: map['data']['results'][0]['id'],
        name: map['data']['results'][0]['name'],
        image: map['data']['results'][0]['thumbnail']['path'] +
            '.' +
            map['data']['results'][0]['thumbnail']['extension'],
      ),
      CharacterEntity(
        id: map['data']['results'][1]['id'],
        name: map['data']['results'][1]['name'],
        image: map['data']['results'][1]['thumbnail']['path'] +
            '.' +
            map['data']['results'][1]['thumbnail']['extension'],
      ),
    ]);
  });

  test(
      'should throw unexpected Error if httpClient returns 200 with invalid data',
      () async {
    mockHttpData({
      'data': {'results': []}
    });

    expect(() => sut.fetch(offSet, url), throwsA(DomainError.unexpected));
  });

  test('should throw unexpectedError if httpClient returns 404', () async {
    mockHttpError(HttpError.notFound);

    final characters = sut.fetch(offSet, url);

    expect(characters, throwsA(DomainError.unexpected));
  });

  test('Should throw UnexpectedError if HttpClient returns 500', () async {
    mockHttpError(HttpError.serverError);

    final future = sut.fetch(offSet, url);

    expect(future, throwsA(DomainError.unexpected));
  });
}
