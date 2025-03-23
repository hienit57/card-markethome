part of 'package_detail_cubit.dart';

class PackageDetailState extends Equatable {
  const PackageDetailState({
    this.onFetchCardPackageDetail = FormzSubmissionStatus.initial,
    this.cardDetailResponse,
    this.onFetchRiceBookPackages = FormzSubmissionStatus.initial,
    this.packagesPage = 1,
    this.canLoadMorepackages = false,
    this.packages = const [],
    this.error = '',
  });

  final FormzSubmissionStatus onFetchCardPackageDetail;
  final CardDetailResponse? cardDetailResponse;

  final FormzSubmissionStatus onFetchRiceBookPackages;
  final int packagesPage;
  final bool canLoadMorepackages;
  final List<RicebookPackageModel> packages;

  final String error;

  PackageDetailState copyWith({
    FormzSubmissionStatus? onFetchCardPackageDetail,
    CardDetailResponse? cardDetailResponse,
    FormzSubmissionStatus? onFetchRiceBookPackages,
    int? packagesPage,
    bool? canLoadMorepackages,
    List<RicebookPackageModel>? packages,
    String? error,
  }) {
    return PackageDetailState(
      onFetchCardPackageDetail:
          onFetchCardPackageDetail ?? this.onFetchCardPackageDetail,
      cardDetailResponse: cardDetailResponse ?? this.cardDetailResponse,
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
        onFetchCardPackageDetail,
        cardDetailResponse,
        onFetchRiceBookPackages,
        packagesPage,
        canLoadMorepackages,
        packages,
        error,
      ];

  String get imageCardPackage =>
      cardDetailResponse?.pack?.pack?.metadata?.thumbailUrl ?? '';

  String get priceCardPackage =>
      cardDetailResponse?.pack?.pack?.originalPrice?.toAppCurrencyString() ??
      '';

  String get nameCardPackage => cardDetailResponse?.pack?.pack?.name ?? '';

  String get descriptionCardPackage =>
      cardDetailResponse?.pack?.pack?.description ?? '';

  int get cardPackageSold => cardDetailResponse?.pack?.soldPack ?? 0;

  int get cardPackageTotal => cardDetailResponse?.pack?.totalPack ?? 0;
}
