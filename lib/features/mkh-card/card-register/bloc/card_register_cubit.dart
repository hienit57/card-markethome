import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

part 'card_register_state.dart';

class CardRegisterCubit extends Cubit<CardRegisterState> {
  CardRegisterCubit({
    required CardUsecase cardUsecase,
    required GlobalConfigByKeyUsecase globalConfigByKeyUsecase,
    required MarshopUsecase marshopUsecase,
  })  : _cardUsecase = cardUsecase,
        _globalConfigByKeyUsecase = globalConfigByKeyUsecase,
        _marshopUsecase = marshopUsecase,
        super(const CardRegisterState());

  final CardUsecase _cardUsecase;
  final GlobalConfigByKeyUsecase _globalConfigByKeyUsecase;
  final MarshopUsecase _marshopUsecase;
  final debounceHelper = DebounceHelper(milliseconds: 300);

  final nameCtrl = TextEditingController();
  final idVdoneCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final referralCtrl = TextEditingController();

  Future<void> initData() async {
    setCurrentStep(RegisterStepEnum.step1);
    await Future.wait([
      fetchCardPackagesIntroduction(),
      fetchAgenciesSellingCards(),
    ]);
    _fetchDataFromLocalStorage();
  }

  Future<void> _fetchDataFromLocalStorage() async {
    final userInformationCached = await SharedPrefHelper.getUser();

    nameCtrl.text = userInformationCached?.fullName ?? '';
    idVdoneCtrl.text = userInformationCached?.pDoneId ?? '';
    phoneCtrl.text = userInformationCached?.phone ?? '';
    emailCtrl.text = userInformationCached?.email ?? '';

    final userRegisterPayload = CardRegisterPayload.copyWith(
      userInformationCached: userInformationCached,
    );

    final setInitTotalPack =
        state.cardPackagesResponse?.packs?.first.totalPack ?? 0;

    final updatePayload = userRegisterPayload
      ..totalPack = setInitTotalPack != 0 ? 1 : 0
      ..emailNew = userInformationCached?.email ?? ''
      ..nameOwnerNew = userInformationCached?.fullName ?? '';

    emit(state.copyWith(userRegisterPayload: updatePayload));
  }

  Future<void> fetchCardPackagesIntroduction() async {
    emit(state.copyWith(
      onFetchCardPackagesIntroduction: FormzSubmissionStatus.inProgress,
    ));

    try {
      const keyRequest = 'card-mkh-package-introduction';
      final response = await _globalConfigByKeyUsecase
          .fetchItemsGlobalConfigByKey(keyRequest);
      emit(state.copyWith(
        onFetchCardPackagesIntroduction: FormzSubmissionStatus.success,
        cardPackagesIntroductionResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchCardPackagesIntroduction: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchAgenciesSellingCards() async {
    try {
      final response = await _cardUsecase.fetchAgenciesSellingCards();
      final agencyId = response?.agencies?.first.id ?? 0;

      await fetchCardPackages(agencyId);

      emit(state.copyWith(
        agencyCardMKHResponse: response?.agencies?.first,
      ));
    } catch (e) {
      emit(state.copyWith(
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchCardPackages(int agencyId) async {
    emit(state.copyWith(
      onFetchCardPackages: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _cardUsecase.fetchCardPackages(
        agencyId: agencyId,
      );

      emit(state.copyWith(
        onFetchCardPackages: FormzSubmissionStatus.success,
        cardPackagesResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchCardPackages: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchMarshopByUserId({
    required String pDoneId,
  }) async {
    emit(state.copyWith(
        onFetchMarshopByUserId: FormzSubmissionStatus.inProgress));

    try {
      referralCtrl.text = pDoneId;

      final response = await _marshopUsecase.fetchMarshopByUserId(
        pdoneId: pDoneId,
      );
      if (response != null) {
        emit(state.copyWith(
          onFetchMarshopByUserId: FormzSubmissionStatus.success,
          marshopByUserIdResponse: response,
        ));
        updatePayload();
      }
    } catch (e) {
      emit(state.copyWith(
        onFetchMarshopByUserId: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> createBillBuyCard() async {
    try {
      final agencyId = state.agencyCardMKHResponse?.id ?? 0;

      final request = CreateBillBuyCardPayload(
        packId: state.userRegisterPayload?.cardMKH?.id ?? 0,
        refererId: state.userRegisterPayload?.marshopRefferal?.id ?? 0,
        amount: state.userRegisterPayload?.totalPack ?? 0,

        ///{ 1 : BankTransfer, 2 : CreditCard, 3 : VNPay, 4 : Directly, 5 : UserWallet }
        paymentMethod: 3,
      );

      final response = await _cardUsecase.createBillBuyCard(
        agencyId: agencyId,
        request: request,
      );

      emit(state.copyWith(
        onCreateBillBuyCard: FormzSubmissionStatus.success,
        billBuyCardResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        onCreateBillBuyCard: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchNextCardRank() async {
    emit(state.copyWith(
      onFetchNextCardRank: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _cardUsecase.fetchNextCardRank(
        packId: state.userRegisterPayload?.cardMKH?.id ?? 0,
        amount: state.userRegisterPayload?.totalPack ?? 0,
      );

      emit(state.copyWith(
        onFetchNextCardRank: FormzSubmissionStatus.success,
        nextCardRankResponse: response,
      ));
    } catch (e) {
      emit(state.copyWith(
        onFetchNextCardRank: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> createRequestBuyCard() async {
    emit(state.copyWith(
      onCreateRequestBuyCard: FormzSubmissionStatus.inProgress,
    ));
    try {
      final agencyId = state.agencyCardMKHResponse?.id ?? 0;
      final billId = state.billBuyCardResponse?.billId ?? '';
      final bankAccountId = state.billBuyCardResponse?.bankAccount?.id ?? 0;

      final countryId = state.userRegisterPayload?.address?.country?.id ?? 0;
      final provinceId = state.userRegisterPayload?.address?.province?.id ?? 0;
      final districtId = state.userRegisterPayload?.address?.district?.id ?? 0;
      final wardId = state.userRegisterPayload?.address?.ward?.id ?? 0;
      final specificAddress = state.userRegisterPayload?.address?.address ?? '';

      final response = await _cardUsecase.createRequestBuyCard(
        agencyId: agencyId,
        payload: CreateRequestBuyCardPayload(
          billId: billId,
          bankAccountId: bankAccountId,
          voucherPackBuyerInfo: BuyerInforPayload(
            fullName: state.userRegisterPayload?.fullName ?? '',
            vdoneID: state.userRegisterPayload?.pDoneId ?? '',
            phoneNumber: state.userRegisterPayload?.phone ?? '',
            email: state.userRegisterPayload?.email ?? '',
            country: countryId.toString(),
            province: provinceId.toString(),
            district: districtId.toString(),
            ward: wardId.toString(),
            address: specificAddress,
          ),
        ),
      );

      if (response?.transactionId != null) {
        updatePayload();
        emit(state.copyWith(
          onCreateRequestBuyCard: FormzSubmissionStatus.success,
          transactionResponse: response,
        ));
      } else {
        emit(state.copyWith(
          onCreateRequestBuyCard: FormzSubmissionStatus.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        onCreateRequestBuyCard: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> confirmPayment() async {
    emit(state.copyWith(
      onConfirmPayment: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _cardUsecase.confirmPayment(
        transactionId: state.transactionResponse?.transactionId ?? 0,
      );

      if (response == true) {
        emit(state.copyWith(
          onConfirmPayment: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(onConfirmPayment: FormzSubmissionStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(
        onConfirmPayment: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> cancelTransaction() async {
    emit(state.copyWith(
      onCancelTransaction: FormzSubmissionStatus.inProgress,
    ));

    try {
      final response = await _cardUsecase.cancelTransaction(
        transactionId: state.transactionResponse?.transactionId ?? 0,
      );

      if (response == true) {
        emit(state.copyWith(
          onCancelTransaction: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(
          onCancelTransaction: FormzSubmissionStatus.failure,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        onCancelTransaction: FormzSubmissionStatus.failure,
        error: e.toString(),
      ));
    }
  }

  void setCurrentStep(RegisterStepEnum step) {
    emit(state.copyWith(currentStep: step));
  }

  void setCurrentPayment(CardRegisterPaymentEnum payment) {
    emit(state.copyWith(currentPayment: payment));
  }

  void setTotalPack(int totalPack) {
    emit(state.copyWith(totalPack: totalPack));
    updatePayload();
  }

  void setNewAddress(
      CountryModel? newCountry,
      ProvinceModel? newProvince,
      DistrictModel? newDistrict,
      WardModel? newWard,
      String? newSpecificAddress) {
    emit(state.copyWith(
      newCountry: newCountry,
      newProvince: newProvince,
      newDistrict: newDistrict,
      newWard: newWard,
      newSpecificAddress: newSpecificAddress,
    ));
    updatePayload();
  }

  void updatePayload() {
    final currentPayload = state.userRegisterPayload ?? CardRegisterPayload();

    final updatedPayload = currentPayload
      ..agencyCardMKH = state.agencyCardMKHResponse
      ..cardMKH = state.cardPackagesResponse?.packs?.first.pack
      ..nameOwnerNew = nameCtrl.text.trim()
      ..emailNew = emailCtrl.text.trim()
      ..refferalCode = referralCtrl.text.trim()
      ..marshopRefferal = state.marshopByUserIdResponse
      ..billBuyCard = state.billBuyCardResponse

      ///Total pack
      ..totalPack = state.totalPack ?? currentPayload.totalPack

      ///Address
      ..countryNew = state.newCountry ?? currentPayload.countryNew
      ..provinceNew = state.newProvince ?? currentPayload.provinceNew
      ..districtNew = state.newDistrict ?? currentPayload.districtNew
      ..wardNew = state.newWard ?? currentPayload.wardNew
      ..specificAddressNew =
          state.newSpecificAddress ?? currentPayload.specificAddressNew;

    final enableButtonRegister = _validateRegisterButton(updatedPayload);

    emit(state.copyWith(
      userRegisterPayload: updatedPayload,
      isDisableButtonRegister: !enableButtonRegister,
      onCreateBillBuyCard: FormzSubmissionStatus.initial,
    ));
  }

  bool _validateRegisterButton(CardRegisterPayload payload) {
    final isAddressValid = ValidationHelper.specialCharactersAndEmpty(
          payload.specificAddressNew,
          'Địa chỉ cụ thể',
        ) ==
        null;

    final isNameValid = ValidationHelper.specialCharactersAndEmpty(
          payload.nameOwnerNew,
          'Tên chủ sở hữu',
        ) ==
        null;

    final isEmailValid = ValidationHelper.email(payload.emailNew) == null;

    return payload.cardMKH?.id != null &&
        payload.totalPack != 0 &&
        (payload.emailNew?.isNotEmpty ?? false) &&
        isEmailValid &&
        (payload.specificAddressNew?.isNotEmpty ?? false) &&
        isAddressValid &&
        (payload.refferalCode?.isNotEmpty ?? false) &&
        isNameValid &&
        payload.countryNew != null &&
        payload.provinceNew != null &&
        payload.districtNew != null &&
        payload.wardNew != null;
  }

  @override
  Future<void> close() {
    nameCtrl.dispose();
    idVdoneCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    referralCtrl.dispose();
    return super.close();
  }
}
