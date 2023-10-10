import 'package:faker/faker.dart';
import 'package:marvel_characters/data/http/http.dart';
import 'package:marvel_characters/data/usecases/remote_fetch_comics.dart';
import 'package:marvel_characters/domain/entities/entities.dart';
import 'package:marvel_characters/domain/helpers/helpers.dart';
import 'package:test/test.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientMock extends Mock implements HttpClient {}

Map mockValidData() => {
      'data': {
        'results': [
          {
            'id': faker.randomGenerator.integer(1000),
            'title': faker.randomGenerator.string(100),
            'description': faker.randomGenerator.string(1000),
            'thumbnail': {'path': faker.internet.httpUrl(), 'extension': 'jpg'},
          },
          {
            'id': faker.randomGenerator.integer(1000),
            'title': faker.randomGenerator.string(100),
            'description': faker.randomGenerator.string(1000),
            'thumbnail': {'path': faker.internet.httpUrl(), 'extension': 'jpg'},
          },
        ],
      },
    };

void main() {
  late RemoteFetchComics sut;
  late HttpClientMock httpClient;
  late String url;

  setUp(() {
    httpClient = HttpClientMock();
    sut = RemoteFetchComics(httpClient: httpClient);
    url = faker.internet.httpUrl();
  });

  test('should return a list of comics if HttpClient returns 200', () async {
    when(() => httpClient.request<Map>(url: any(named: 'url'), method: 'get'))
        .thenAnswer((_) async => mockValidData());

    final comics = await sut.fetch(url);

    expect(comics, isA<List<ComicEntity>>());
    expect(comics.length, equals(2));
  });

  test(
      'should throw DomainError.unexpected if HttpClient returns 200 with null data',
      () async {
    final responseBody = {'data': null};

    when(() => httpClient.request<Map>(url: any(named: 'url'), method: 'get'))
        .thenAnswer((_) async => responseBody);

    expect(() => sut.fetch(url), throwsA(DomainError.unexpected));
  });

  test(
      'should throw DomainError.unexpected if HttpClient returns 200 with null results',
      () async {
    final responseBody = {
      'data': {'results': null},
    };

    when(() => httpClient.request<Map>(url: any(named: 'url'), method: 'get'))
        .thenAnswer((_) async => responseBody);

    expect(() => sut.fetch(url), throwsA(DomainError.unexpected));
  });

  test(
      'should return a list of comics with a single comic if HttpClient returns 200 with one result',
      () async {
    final responseBody = {
      'data': {
        'results': [
          {
            'id': faker.randomGenerator.integer(1000),
            'title': faker.randomGenerator.string(100),
            'description': faker.randomGenerator.string(1000),
            'thumbnail': {'path': faker.internet.httpUrl(), 'extension': 'jpg'},
          },
        ],
      },
    };

    when(() => httpClient.request<Map>(url: any(named: 'url'), method: 'get'))
        .thenAnswer((_) async => responseBody);

    final comics = await sut.fetch(url);

    expect(comics, isA<List<ComicEntity>>());
    expect(comics.length, equals(1));
  });

  test('should throw DomainError.unexpected if HttpClient returns an error',
      () async {
    when(() => httpClient.request<Map>(url: any(named: 'url'), method: 'get'))
        .thenThrow(HttpError.serverError);

    expect(() => sut.fetch(url), throwsA(DomainError.unexpected));
  });
}
