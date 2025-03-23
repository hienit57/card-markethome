part of 'purchase_batch_cubit.dart';

class PurchaseBatchState extends Equatable {
  const PurchaseBatchState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  PurchaseBatchState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return PurchaseBatchState(
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
