part of 'ricebook_cubit.dart';

class RicebookState extends Equatable {
  const RicebookState({
    this.onFetchRiceBookPackages = FormzSubmissionStatus.initial,
    this.packagesPage = 1,
    this.canLoadMorepackages = false,
    this.packages = const [],
    this.error = '',
  });

  final FormzSubmissionStatus onFetchRiceBookPackages;
  final int packagesPage;
  final bool canLoadMorepackages;
  final List<RicebookPackageModel> packages;

  final String error;

  RicebookState copyWith({
    FormzSubmissionStatus? onFetchRiceBookPackages,
    int? packagesPage,
    bool? canLoadMorepackages,
    List<RicebookPackageModel>? packages,
    String? error,
  }) {
    return RicebookState(
      onFetchRiceBookPackages:
          onFetchRiceBookPackages ?? this.onFetchRiceBookPackages,
      packagesPage: packagesPage ?? this.packagesPage,
      canLoadMorepackages: canLoadMorepackages ?? this.canLoadMorepackages,
      packages: packages ?? this.packages,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        onFetchRiceBookPackages,
        packagesPage,
        canLoadMorepackages,
        packages,
        error,
      ];
}
