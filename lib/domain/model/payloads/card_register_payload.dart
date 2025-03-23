import 'package:card_markethome/index.dart';

class CardRegisterPayload extends UserInformationModel {
  CardRegisterPayload({
    super.pDoneId,
    super.fullName,
    super.birthday,
    super.sexCode,
    super.accountInfo,
    super.avatar,
    super.id,
    super.displayName,
    super.type,
    super.deleted,
    super.phone,
    super.phoneCode,
    super.email,
    super.address,
    this.cardMKH,
    this.totalPack,
    this.refferalCode,
    this.marshopRefferal,
    this.agencyCardMKH,
    this.transactionId,
    this.billBuyCard,
    this.nameOwnerNew,
    this.emailNew,
    this.countryNew,
    this.provinceNew,
    this.districtNew,
    this.wardNew,
    this.specificAddressNew,
  });

  factory CardRegisterPayload.copyWith({
    UserInformationModel? userInformationCached,
  }) {
    return CardRegisterPayload(
      ///User information
      pDoneId: userInformationCached?.pDoneId,
      fullName: userInformationCached?.fullName,
      birthday: userInformationCached?.birthday,
      sexCode: userInformationCached?.sexCode,
      accountInfo: userInformationCached?.accountInfo,
      avatar: userInformationCached?.avatar,
      id: userInformationCached?.id,
      displayName: userInformationCached?.displayName,
      type: userInformationCached?.type,
      deleted: userInformationCached?.deleted,
      phone: userInformationCached?.phone,
      phoneCode: userInformationCached?.phoneCode,
      email: userInformationCached?.email,

      emailNew: userInformationCached?.email,
      nameOwnerNew: userInformationCached?.fullName,

      ///Address information
      address: userInformationCached?.address,
      countryNew: userInformationCached?.address?.country,
      provinceNew: userInformationCached?.address?.province,
      districtNew: userInformationCached?.address?.district,
      wardNew: userInformationCached?.address?.ward,
      specificAddressNew: userInformationCached?.address?.address,
    );
  }

  int? totalPack;
  String? refferalCode;
  int? transactionId;

  MarshopModel? marshopRefferal;
  CardModel? cardMKH;
  AgencyModel? agencyCardMKH;
  BillModel? billBuyCard;

  String? nameOwnerNew;
  String? emailNew;
  CountryModel? countryNew;
  ProvinceModel? provinceNew;
  DistrictModel? districtNew;
  WardModel? wardNew;
  String? specificAddressNew;
}
