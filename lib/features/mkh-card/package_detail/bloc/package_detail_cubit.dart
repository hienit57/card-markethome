import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

part 'package_detail_state.dart';

class PackageDetailCubit extends Cubit<PackageDetailState> {
  PackageDetailCubit({
    required CardUsecase cardUsecase,
    required RicebookUsecase ricebookUsecase,
  })  : _cardUsecase = cardUsecase,
        _ricebookUsecase = ricebookUsecase,
        super(const PackageDetailState());

  final CardUsecase _cardUsecase;
  final RicebookUsecase _ricebookUsecase;

  Future<void> init({required int agencyId, required int packId}) async {
    await Future.wait([
      fetchRiceBookPackages(),
      fetchCardPackageDetail(
        agencyId: agencyId,
        packId: packId,
      ),
    ]);
  }

  Future<void> fetchCardPackageDetail({
    required int agencyId,
    required int packId,
  }) async {
    emit(state.copyWith(
      onFetchCardPackageDetail: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _cardUsecase.fetchCardPackageDetail(
        agencyId: agencyId,
        packId: packId,
      );

      emit(state.copyWith(
        onFetchCardPackageDetail: FormzSubmissionStatus.success,
        cardDetailResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchCardPackageDetail: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
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
