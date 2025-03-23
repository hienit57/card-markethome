
import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeState', () {
    test('copyWith creates a new instance with the provided values', () {
      final state = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Manh')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final newState = state.copyWith(
        status: FormzSubmissionStatus.success,
        characters: [Character(id: 2, name: 'Hien')],
        hasReachedEnd: false,
        currentPage: 3,
      );

      expect(newState.status, equals(FormzSubmissionStatus.success));
      expect(newState.characters.length, equals(1));
      expect(newState.characters[0].id, equals(2));
      expect(newState.characters[0].name, equals('Hien'));
      expect(newState.hasReachedEnd, equals(false));
      expect(newState.currentPage, equals(3));
    });

    test('copyWith maintains unchanged values', () {
      final state = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Hien')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final newState = state.copyWith(status: FormzSubmissionStatus.success);

      expect(newState.status, equals(FormzSubmissionStatus.success));
      expect(newState.characters, equals(state.characters));
      expect(newState.hasReachedEnd, equals(state.hasReachedEnd));
      expect(newState.currentPage, equals(state.currentPage));
    });

    test('props returns a list of the object properties', () {
      final state = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Manh')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final props = state.props;

      expect(props.length, equals(4));
      expect(props[0], equals(FormzSubmissionStatus.inProgress));
      expect(props[1], equals(state.characters));
      expect(props[2], equals(true));
      expect(props[3], equals(2));
    });

    test('equivalent instances have the same props', () {
      final state1 = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Ngoc')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final state2 = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Ngoc')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      expect(state1.props, equals(state2.props));
    });

    test('distinct instances have different props', () {
      final state1 = HomeState(
        status: FormzSubmissionStatus.inProgress,
        characters: [Character(id: 1, name: 'Manh')],
        hasReachedEnd: true,
        currentPage: 2,
      );

      final state2 = HomeState(
        status: FormzSubmissionStatus.success,
        characters: [Character(id: 2, name: 'Ngoc')],
        hasReachedEnd: false,
        currentPage: 3,
      );

      expect(state1.props, isNot(equals(state2.props)));
    });
  });
}
