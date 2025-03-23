import 'package:card_markethome/domain/repositories/character_repository.dart';
import 'package:card_markethome/domain/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

void main() {
  group('CharacterUseCase', () {
    late CharacterUseCase useCase;
    late MockCharacterRepository mockCharacterRepository;

    setUp(() {
      mockCharacterRepository = MockCharacterRepository();
      useCase = CharacterUseCase(repository: mockCharacterRepository);
    });

    test('should return list of characters', () async {
      const page = 1;
      final characters = [
        Character(id: 1, name: 'Character 1'),
        Character(id: 2, name: 'Character 2'),
      ];

      when(() => mockCharacterRepository.getCharacters(page: page))
          .thenAnswer((_) async => characters);

      final result = await useCase.getCharacterAction(page: page);

      expect(result, equals(characters));

      verify(() => mockCharacterRepository.getCharacters(page: page)).called(1);

      /// make sure there are no more functions called on the mock
      verifyNoMoreInteractions(mockCharacterRepository);
    });
  });
}
