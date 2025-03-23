import 'package:card_markethome/data/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

import '../../data_test.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('Character Repository Impl', () {
    late MockDio mockDio;
    late CharacterRepositoryImpl repository;

    setUp(() {
      mockDio = MockDio();
      repository = CharacterRepositoryImpl();
      when(() => mockDio.get(any())).thenAnswer((_) async => Response(data: {
            'results': characterList1
          }, statusCode: 200, requestOptions: RequestOptions(path: '')));
    });

    test('returns list of characters on successful response', () async {
      final characters = await repository.getCharacters(page: 1);
      expect(characters[0].name, 'Rick Sanchez');
      expect(characters[1].name, 'Morty Smith');
    });

  });
}
