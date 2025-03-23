import 'package:card_markethome/index.dart';

class UserInformationModel extends UserProfileModel {
  UserInformationModel({
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
    this.address,
  });

  //  factory UserInformationModel.fromJson(Map<String, dynamic> json) {
  //   return UserInformationModel(
  //     pDoneId: json['pDoneId'],
  //     fullName: json['fullName'],
  //     birthday: json['birthday'],
  //     sexCode: json['sexCode'],
  //     accountInfo: json['accountInfo'] != null
  //         ? AccountInfo.fromJson(json['accountInfo'])
  //         : null,
  //     avatar: json['avatar'],
  //     id: json['id'],
  //     displayName: json['displayName'],
  //     type: json['type'],
  //     deleted: json['deleted'],
  //     phone: json['phone'],
  //     phoneCode: json['phoneCode'],
  //     email: json['email'],
  //     address: json['address'] != null
  //         ? UserAddressModel.fromJson(json['address'])
  //         : null,
  //   );
  // }

  factory UserInformationModel.fromJson(Map<String, dynamic> json) {
    return UserInformationModel(
      pDoneId: json['pDoneId'],
      fullName: json['fullName'],
      birthday: json['birthday'],
      sexCode: json['sexCode'],
      accountInfo: json['accountInfo'] != null
          ? AccountInfo.fromJson(json['accountInfo'] as Map<String, dynamic>)
          : null,
      avatar: json['avatar'],
      id: json['id'],
      displayName: json['displayName'],
      type: json['type'],
      deleted: json['deleted'],
      phone: json['phone'],
      phoneCode: json['phoneCode'],
      email: json['email'],
      address: json['address'] != null
          ? UserAddressModel.fromJson(json['address'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'pDoneId': pDoneId,
      'fullName': fullName,
      'birthday': birthday,
      'sexCode': sexCode,
      'accountInfo': accountInfo?.toJson(),
      'avatar': avatar,
      'id': id,
      'displayName': displayName,
      'type': type,
      'deleted': deleted,
      'phone': phone,
      'phoneCode': phoneCode,
      'email': email,
      'address': address?.toJson(),
    };
  }

  factory UserInformationModel.copyWith({
    UserProfileModel? userProfile,
    UserAddressModel? address,
  }) {
    return UserInformationModel(
      pDoneId: userProfile?.pDoneId,
      fullName: userProfile?.fullName,
      birthday: userProfile?.birthday,
      sexCode: userProfile?.sexCode,
      accountInfo: userProfile?.accountInfo,
      avatar: userProfile?.avatar,
      id: userProfile?.id,
      displayName: userProfile?.displayName,
      type: userProfile?.type,
      deleted: userProfile?.deleted,
      phone: userProfile?.phone,
      phoneCode: userProfile?.phoneCode,
      email: userProfile?.email,
      address: address ?? address,
    );
  }

  final UserAddressModel? address;
}
