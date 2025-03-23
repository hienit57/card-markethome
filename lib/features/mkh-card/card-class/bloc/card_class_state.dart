part of 'card_class_cubit.dart';

class CardClassState extends Equatable {
  const CardClassState({
    this.onFetchCardRanks = FormzSubmissionStatus.initial,
    this.cardRanks,
    this.error = '',
  });

  final FormzSubmissionStatus onFetchCardRanks;
  final List<CardRankModel>? cardRanks;

  final String error;

  CardClassState copyWith({
    FormzSubmissionStatus? onFetchCardRanks,
    List<CardRankModel>? cardRanks,
    String? error,
  }) {
    return CardClassState(
      onFetchCardRanks: onFetchCardRanks ?? this.onFetchCardRanks,
      cardRanks: cardRanks ?? this.cardRanks,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onFetchCardRanks,
        cardRanks,
        error,
      ];
}
