part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({
    this.onFetchUserProfile = FormzSubmissionStatus.initial,
    this.userProfile,
    this.onFetchUserAddress = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final FormzSubmissionStatus onFetchUserProfile;
  final UserProfileModel? userProfile;

  final FormzSubmissionStatus onFetchUserAddress;
  final String error;

  SplashState copyWith({
    FormzSubmissionStatus? onFetchUserProfile,
    UserProfileModel? userProfile,
    FormzSubmissionStatus? onFetchUserAddress,
    String? error,
  }) {
    return SplashState(
      onFetchUserProfile: onFetchUserProfile ?? this.onFetchUserProfile,
      userProfile: userProfile ?? this.userProfile,
      onFetchUserAddress: onFetchUserAddress ?? this.onFetchUserAddress,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onFetchUserProfile,
        userProfile,
        onFetchUserAddress,
        error,
      ];
}
