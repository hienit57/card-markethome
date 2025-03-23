import 'package:card_markethome/index.dart';
import 'package:carousel_slider/carousel_slider.dart';

part 'card_class_state.dart';

class CardClassCubit extends Cubit<CardClassState> {
  CardClassCubit({
    required CardUsecase cardUsecase,
  })  : _cardUsecase = cardUsecase,
        super(const CardClassState());

  final CardUsecase _cardUsecase;

  final CarouselController carouselController = CarouselController();
  final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  Future<void> fetchCardRanks() async {
    emit(state.copyWith(
      onFetchCardRanks: FormzSubmissionStatus.inProgress,
    ));

    try {
      final result = await _cardUsecase.fetchCardRanks();
      emit(state.copyWith(
        onFetchCardRanks: FormzSubmissionStatus.success,
        cardRanks: result,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchCardRanks: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }
}
