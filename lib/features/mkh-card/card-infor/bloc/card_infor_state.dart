part of 'card_infor_cubit.dart';

class CardInforState extends Equatable {
  const CardInforState({
    this.onFetchUserCardInfo = FormzSubmissionStatus.initial,
    this.userCardInfo,
    this.error = '',
  });

  final FormzSubmissionStatus onFetchUserCardInfo;
  final UserCardModel? userCardInfo;

  final String error;

  CardInforState copyWith({
    FormzSubmissionStatus? onFetchUserCardInfo,
    UserCardModel? userCardInfo,
    String? error,
  }) {
    return CardInforState(
      onFetchUserCardInfo: onFetchUserCardInfo ?? this.onFetchUserCardInfo,
      userCardInfo: userCardInfo ?? this.userCardInfo,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onFetchUserCardInfo,
        userCardInfo,
        error,
      ];
}
