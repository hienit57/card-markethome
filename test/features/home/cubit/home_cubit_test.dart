import 'package:bloc_test/bloc_test.dart';
import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data_test.dart';

class MockCharacterUseCase extends Mock implements CharacterUseCase {}

void main() {
  group('HomeCubit', () {
    late MockCharacterUseCase getAllCharactersMock;
    late HomeCubit cubit;

    setUp(() {
      getAllCharactersMock = MockCharacterUseCase();
      cubit = HomeCubit(useCase: getAllCharactersMock);
    });

    test('should have correct initial state', () {
      const expected = HomeState(
        characters: [],
        currentPage: 1,
        status: FormzSubmissionStatus.initial,
        hasReachedEnd: false,
      );

      expect(
        HomeCubit(useCase: getAllCharactersMock).state,
        expected,
      );
    });

    group('.fetchNextPage()', () {
      blocTest<HomeCubit, HomeState>(
        'emits loading -> runs UseCase -> emits success with a list',
        build: () => cubit,
        setUp: () {
          when(() => getAllCharactersMock.getCharacterAction(page: 1))
              .thenAnswer(
            (_) async => characterList1,
          );
        },
        act: (cubit) => cubit.fetchNextPage(),
        expect: () => [
          const HomeState(
            status: FormzSubmissionStatus.inProgress,
          ),
          HomeState(
            status: FormzSubmissionStatus.success,
            characters: characterList1,
            hasReachedEnd: false,
            currentPage: 2,
          ),
        ],
        verify: (_) {
          verify(() => getAllCharactersMock.getCharacterAction(page: 1));
          verifyNoMoreInteractions(getAllCharactersMock);
        },
      );

      blocTest<HomeCubit, HomeState>(
        "emits a state with hasReachedEnd 'true' when there are no more items",
        build: () => cubit,
        setUp: () {
          when(() => getAllCharactersMock.getCharacterAction(page: 1))
              .thenAnswer((_) async => []);
        },
        act: (cubit) => cubit.fetchNextPage(),
        skip: 1, // skip 'loading'
        expect: () => [
          const HomeState(
            status: FormzSubmissionStatus.success,
            characters: [],
            hasReachedEnd: true,
            currentPage: 2,
          ),
        ],
      );
    });
  });
}
