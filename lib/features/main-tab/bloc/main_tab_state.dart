part of 'main_tab_cubit.dart';

class MainTabState extends Equatable {
  const MainTabState({
    this.onGetABC = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onGetABC;

  final String error;

  MainTabState copyWith({
    FormzSubmissionStatus? onGetABC,
    String? error,
  }) {
    return MainTabState(
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
