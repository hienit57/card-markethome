import 'package:card_markethome/index.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required RicebookUsecase ricebookUsecase,
  })  : _ricebookUsecase = ricebookUsecase,
        super(const HomeState());

  final RicebookUsecase _ricebookUsecase;

  Future<void> init() async {
    await Future.wait([
      fetchRiceBookPackages(),
    ]);
  }

  Future<void> fetchRiceBookPackages({
    int page = 1,
    int pageSize = 10,
  }) async {
    emit(state.copyWith(
      onFetchRiceBookPackages: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _ricebookUsecase.fetchRiceBookPackages(
        page: page,
        pageSize: pageSize,
      );

      emit(
        state.copyWith(
          onFetchRiceBookPackages: FormzSubmissionStatus.success,
          packages: [
            ...state.packages,
            ...response?.certProducts ?? [],
          ],
          canLoadMorepackages: response?.certProducts?.length == 10,
          packagesPage: state.packagesPage + 1,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        onFetchRiceBookPackages: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
