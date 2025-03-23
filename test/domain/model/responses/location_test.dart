import 'package:card_markethome/domain/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location', () {
    test('Two instants should be equal when the properties are same', () {
      final location1 = Location(
        name: 'Earth',
        url: 'https://example.com/earth',
      );

      final location2 = Location(
        name: 'Earth',
        url: 'https://example.com/earth',
      );

      expect(location1, equals(location2));
    });

    test('Two instants should be different when the properties are different', () {
      final location1 = Location(
        name: 'Earth',
        url: 'https://example.com/earth',
      );

      final location2 = Location(
        name: 'Mars',
        url: 'https://example.com/mars',
      );

      expect(location1, isNot(equals(location2)));
    });
  });
}