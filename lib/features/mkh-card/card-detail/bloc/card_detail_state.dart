part of 'card_detail_cubit.dart';

class CardDetailState extends Equatable {
  const CardDetailState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  CardDetailState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return CardDetailState(
      onGetABC: onGetABC ?? this.onGetABC,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onGetABC,
        error,
      ];
}
