import 'package:card_markethome/domain/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Character', () {
    test('Two instants should be equal when the properties are same', () {
      final character1 = Character(
        id: 1,
        name: 'Manh',
        status: 'Single',
        species: 'Human',
      );

      final character2 = Character(
        id: 1,
        name: 'Manh',
        status: 'Single',
        species: 'Human',
      );

      expect(character1, equals(character2));
    });

    test('Two instants should be different when the properties are different', () {
      final character1 = Character(
        id: 1,
        name: 'Manh',
        status: 'Single',
        species: 'Human',
      );

      final character2 = Character(
        id: 2,
        name: 'Hien',
        status: 'Single',
        species: 'Human',
      );

      expect(character1, isNot(equals(character2)));
    });
  });
}
