part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  NotificationsState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return NotificationsState(
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
