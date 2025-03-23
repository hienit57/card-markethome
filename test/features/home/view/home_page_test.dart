import 'package:bloc_test/bloc_test.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../../data_test.dart';
import '../cubit/home_cubit_test.dart';

class HomeCubitMock extends MockCubit<HomeState> implements HomeCubit {}

void main() {
  group('CharacterPage', () {
    late MockCharacterUseCase getAllCharactersMock;
    late HomeCubit cubit;

    setUp(() {
      getAllCharactersMock = MockCharacterUseCase();
      cubit = HomeCubitMock();

      when(() =>
              getAllCharactersMock.getCharacterAction(page: any(named: 'page')))
          .thenAnswer((_) async => [...characterList1, ...characterList2]);
    });

    testWidgets('renders a CharacterView', (tester) async {
      when(() =>
              getAllCharactersMock.getCharacterAction(page: any(named: 'page')))
          .thenAnswer(
        (_) async => characterList1,
      );

      await tester.pumpApp(
        const HomePage(),
        getAllCharacters: getAllCharactersMock,
      );

      /// check CharacterView is displayed
      /// TODO: FIX ME SOON
      //expect(find.byType(CharacterView), findsOneWidget);
    });

    testWidgets('renders a list of Characters widgets', (tester) async {
      const key = Key('character_page_list_key');

      /// mock the state of the cubit then return the characters
      when(() => cubit.state).thenReturn(
        HomeState(
          currentPage: 2,
          status: FormzSubmissionStatus.success,
          hasReachedEnd: true,
          characters: [...characterList1, ...characterList2],
        ),
      );
      when(() => cubit.fetchNextPage()).thenAnswer((_) async => true);

      /// pump the app
      /// Solution 1: custom pump widget to reuse
      await tester.pumpApp(
        BlocProvider.value(
          value: cubit,

          /// TODO: FIX ME SOON

          //child: const CharacterView(),
        ),
        getAllCharacters: getAllCharactersMock,
      );

      /// Solution 2
      // await tester.pumpWidget(
      //   MultiRepositoryProvider(
      //     providers: [
      //       RepositoryProvider.value(
      //         value: getAllCharactersMock,
      //       ),
      //     ],
      //     child: const MaterialApp(
      //         home: CharacterView()
      //     ),
      //   ),
      // );

      /// make sure all the widgets are rendered
      await tester.pumpAndSettle(const Duration(seconds: 2));

      /// make sure the widget that have the key is "character_page_list_key" is existed
      expect(find.byKey(key), findsOneWidget);
      final list = [...characterList1, ...characterList2];

      /// check asynchronous if the number of widget CharacterListItem is equal to the length of the list, using for Stream
      /// TODO: FIX ME SOON

      //expectLater(find.byType(CharacterListItem), findsNWidgets(list.length));
    });
  });
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    CharacterUseCase? getAllCharacters,
  }) {
    final innerChild = Scaffold(
      body: widget,
    );

    return pumpWidget(
      MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(
            value: getAllCharacters ?? MockCharacterUseCase(),
          ),
        ],
        child: MaterialApp(home: innerChild),
      ),
    );
  }
}
