part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.characters = const [],
    this.hasReachedEnd = false,
    this.currentPage = 1,
  });

  final FormzSubmissionStatus status;
  final List<Character> characters;
  final bool hasReachedEnd;
  final int currentPage;

  HomeState copyWith({
    FormzSubmissionStatus? status,
    List<Character>? characters,
    bool? hasReachedEnd,
    int? currentPage,
  }) {
    return HomeState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object> get props => [
        status,
        characters,
        hasReachedEnd,
        currentPage,
      ];
}
