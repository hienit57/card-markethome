import 'package:card_markethome/index.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required CharacterUseCase useCase,
  })  : _characterUseCase = useCase,
        super(const HomeState());

  final CharacterUseCase _characterUseCase;

  Future<void> fetchNextPage() async {
    if (state.hasReachedEnd) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final list =
        await _characterUseCase.getCharacterAction(page: state.currentPage);

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
        hasReachedEnd: list.isEmpty,
        currentPage: state.currentPage + 1,
        characters: List.of(state.characters)..addAll(list),
      ),
    );
  }
}
