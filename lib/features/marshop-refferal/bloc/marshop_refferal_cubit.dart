import 'package:card_markethome/index.dart';

part 'marshop_refferal_state.dart';

class MarshopRefferalCubit extends Cubit<MarshopRefferalState> {
  MarshopRefferalCubit({
    required MarshopUsecase marshopUsecase,
  })  : _marshopUsecase = marshopUsecase,
        super(const MarshopRefferalState());

  final MarshopUsecase _marshopUsecase;

  Future<void> fetchMarshops() async {
    emit(state.copyWith(onFetchMarshops: FormzSubmissionStatus.inProgress));

    try {
      final response = await _marshopUsecase.fetchMarshops(
        pageSize: 20,
      );
      if (response?.marshops != null) {
        emit(state.copyWith(
          onFetchMarshops: FormzSubmissionStatus.success,
          marshops: response?.marshops ?? [],
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        onFetchMarshops: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
