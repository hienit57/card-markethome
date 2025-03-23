import 'package:card_markethome/index.dart';

part 'card_infor_state.dart';

class CardInforCubit extends Cubit<CardInforState> {
  CardInforCubit({
    required CardUsecase cardUsecase,
  })  : _cardUsecase = cardUsecase,
        super(const CardInforState());

  final CardUsecase _cardUsecase;

  Future<void> fetchUserCardInfo() async {
    emit(state.copyWith(
      onFetchUserCardInfo: FormzSubmissionStatus.inProgress,
    ));

    try {
      final result = await _cardUsecase.fetchUserCardInfo();

      emit(state.copyWith(
        onFetchUserCardInfo: FormzSubmissionStatus.success,
        userCardInfo: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchUserCardInfo: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
