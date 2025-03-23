part of 'activity_cubit.dart';

class ActivityState extends Equatable {
  const ActivityState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  ActivityState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return ActivityState(
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
