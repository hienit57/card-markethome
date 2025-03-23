part of 'card_register_cubit.dart';

class CardRegisterState extends Equatable {
  const CardRegisterState({
    this.currentStep = RegisterStepEnum.step1,
    this.onFetchCardPackagesIntroduction = FormzSubmissionStatus.initial,
    this.cardPackagesIntroductionResponse,
    this.onFetchCardPackages = FormzSubmissionStatus.initial,
    this.cardPackagesResponse,
    this.onFetchMarshopByUserId = FormzSubmissionStatus.initial,
    this.marshopByUserIdResponse,
    this.onCreateBillBuyCard = FormzSubmissionStatus.initial,
    this.billBuyCardResponse,
    this.onFetchNextCardRank = FormzSubmissionStatus.initial,
    this.nextCardRankResponse,
    this.onCreateRequestBuyCard = FormzSubmissionStatus.initial,
    this.transactionResponse,
    this.onConfirmPayment = FormzSubmissionStatus.initial,
    this.onCancelTransaction = FormzSubmissionStatus.initial,
    this.currentPage = 1,
    this.currentPayment = CardRegisterPaymentEnum.qrPayment,
    this.agencyCardMKHResponse,
    this.userRegisterPayload,
    this.isDisableButtonRegister = true,

    ///
    this.newCountry,
    this.newProvince,
    this.newDistrict,
    this.newWard,
    this.newSpecificAddress,
    this.totalPack,

    ///
    this.error = '',
  });

  final FormzSubmissionStatus onFetchCardPackagesIntroduction;
  final GlobalConfigByKeyReponse? cardPackagesIntroductionResponse;

  final FormzSubmissionStatus onFetchCardPackages;
  final CardMarkethomeReponse? cardPackagesResponse;

  final FormzSubmissionStatus onFetchMarshopByUserId;
  final MarshopModel? marshopByUserIdResponse;

  final FormzSubmissionStatus onCreateBillBuyCard;
  final BillModel? billBuyCardResponse;

  final FormzSubmissionStatus onFetchNextCardRank;
  final CardRankModel? nextCardRankResponse;

  final FormzSubmissionStatus onCreateRequestBuyCard;
  final TransactionModel? transactionResponse;

  final FormzSubmissionStatus onConfirmPayment;

  final FormzSubmissionStatus onCancelTransaction;

  final int currentPage;
  final RegisterStepEnum currentStep;
  final CardRegisterPaymentEnum currentPayment;

  final AgencyModel? agencyCardMKHResponse;
  final CardRegisterPayload? userRegisterPayload;

  final CountryModel? newCountry;
  final ProvinceModel? newProvince;
  final DistrictModel? newDistrict;
  final WardModel? newWard;
  final String? newSpecificAddress;
  final int? totalPack;

  final bool isDisableButtonRegister;

  final String error;

  CardRegisterState copyWith({
    RegisterStepEnum? currentStep,
    FormzSubmissionStatus? onFetchCardPackagesIntroduction,
    GlobalConfigByKeyReponse? cardPackagesIntroductionResponse,
    FormzSubmissionStatus? onFetchCardPackages,
    CardMarkethomeReponse? cardPackagesResponse,
    FormzSubmissionStatus? onFetchMarshopByUserId,
    MarshopModel? marshopByUserIdResponse,
    FormzSubmissionStatus? onCreateBillBuyCard,
    BillModel? billBuyCardResponse,
    FormzSubmissionStatus? onFetchNextCardRank,
    CardRankModel? nextCardRankResponse,
    FormzSubmissionStatus? onCreateRequestBuyCard,
    TransactionModel? transactionResponse,
    FormzSubmissionStatus? onConfirmPayment,
    FormzSubmissionStatus? onCancelTransaction,
    int? currentPage,
    CardRegisterPaymentEnum? currentPayment,
    AgencyModel? agencyCardMKHResponse,
    CardRegisterPayload? userRegisterPayload,
    UserAddressModel? address,
    String? error,
    bool? isDisableButtonRegister,

    ///
    CountryModel? newCountry,
    ProvinceModel? newProvince,
    DistrictModel? newDistrict,
    WardModel? newWard,
    String? newSpecificAddress,
    int? totalPack,

    ///
  }) {
    return CardRegisterState(
      currentStep: currentStep ?? this.currentStep,
      onFetchCardPackagesIntroduction: onFetchCardPackagesIntroduction ??
          this.onFetchCardPackagesIntroduction,
      cardPackagesIntroductionResponse: cardPackagesIntroductionResponse ??
          this.cardPackagesIntroductionResponse,
      onFetchCardPackages: onFetchCardPackages ?? this.onFetchCardPackages,
      cardPackagesResponse: cardPackagesResponse ?? this.cardPackagesResponse,
      onFetchMarshopByUserId:
          onFetchMarshopByUserId ?? this.onFetchMarshopByUserId,
      marshopByUserIdResponse:
          marshopByUserIdResponse ?? this.marshopByUserIdResponse,
      onCreateBillBuyCard: onCreateBillBuyCard ?? this.onCreateBillBuyCard,
      billBuyCardResponse: billBuyCardResponse ?? this.billBuyCardResponse,
      onFetchNextCardRank: onFetchNextCardRank ?? this.onFetchNextCardRank,
      nextCardRankResponse: nextCardRankResponse ?? this.nextCardRankResponse,
      onCreateRequestBuyCard:
          onCreateRequestBuyCard ?? this.onCreateRequestBuyCard,
      transactionResponse: transactionResponse ?? this.transactionResponse,
      onConfirmPayment: onConfirmPayment ?? this.onConfirmPayment,
      onCancelTransaction: onCancelTransaction ?? this.onCancelTransaction,
      currentPage: currentPage ?? this.currentPage,
      currentPayment: currentPayment ?? this.currentPayment,
      agencyCardMKHResponse:
          agencyCardMKHResponse ?? this.agencyCardMKHResponse,
      userRegisterPayload: userRegisterPayload ?? this.userRegisterPayload,
      isDisableButtonRegister:
          isDisableButtonRegister ?? this.isDisableButtonRegister,

      ///
      newCountry: newCountry ?? this.newCountry,
      newProvince: newProvince ?? this.newProvince,
      newDistrict: newDistrict ?? this.newDistrict,
      newWard: newWard ?? this.newWard,
      newSpecificAddress: newSpecificAddress ?? this.newSpecificAddress,
      totalPack: totalPack ?? this.totalPack,

      ///
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        currentStep,
        onFetchCardPackagesIntroduction,
        cardPackagesIntroductionResponse,
        onFetchCardPackages,
        cardPackagesResponse,
        onFetchMarshopByUserId,
        marshopByUserIdResponse,
        onCreateBillBuyCard,
        billBuyCardResponse,
        onFetchNextCardRank,
        nextCardRankResponse,
        onCreateRequestBuyCard,
        transactionResponse,
        onConfirmPayment,
        onCancelTransaction,
        currentPage,
        currentPayment,
        agencyCardMKHResponse,
        userRegisterPayload,
        isDisableButtonRegister,

        ///
        newCountry,
        newProvince,
        newDistrict,
        newWard,
        newSpecificAddress,
        totalPack,

        ///
        error,
      ];

  CardMarkethome? get cardInfo => cardPackagesResponse?.packs?.first;

  int get packId => cardInfo?.pack?.id ?? 0;

  int get limitTotalPack => cardInfo?.totalPack ?? 0;

  int get countPack => userRegisterPayload?.totalPack ?? 0;

  int get agencyId => agencyCardMKHResponse?.id ?? 0;

  String get totalPriceBuyCard =>
      ((cardPackagesResponse?.packs?.first.pack?.originalPrice ?? 0) *
              countPack)
          .toAppCurrencyString();
}
