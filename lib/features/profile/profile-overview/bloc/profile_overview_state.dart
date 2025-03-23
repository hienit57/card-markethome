part of 'profile_overview_cubit.dart';

class ProfileOverviewState extends Equatable {
  const ProfileOverviewState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  ProfileOverviewState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return ProfileOverviewState(
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
