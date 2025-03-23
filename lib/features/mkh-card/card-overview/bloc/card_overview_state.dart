part of 'card_overview_cubit.dart';

class CardOverviewState extends Equatable {
  const CardOverviewState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  CardOverviewState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return CardOverviewState(
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
