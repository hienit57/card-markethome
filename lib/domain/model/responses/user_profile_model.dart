class UserProfileReponse {
  final UserProfileModel? user;

  UserProfileReponse({
    this.user,
  });

  UserProfileReponse.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? UserProfileModel.fromJson(json['user'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'user': user?.toJson()};
}

class UserProfileModel {
  final String? pDoneId;
  final String? fullName;
  final String? birthday;
  final int? sexCode;
  final AccountInfo? accountInfo;
  final String? avatar;
  final int? id;
  final String? displayName;
  final int? type;
  final bool? deleted;
  final String? phone;
  final String? phoneCode;
  final String? email;

  UserProfileModel({
    this.pDoneId,
    this.fullName,
    this.birthday,
    this.sexCode,
    this.accountInfo,
    this.avatar,
    this.id,
    this.displayName,
    this.type,
    this.deleted,
    this.phone,
    this.phoneCode,
    this.email,
  });

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : pDoneId = json['pDoneId'] as String?,
        fullName = json['fullName'] as String?,
        birthday = json['birthday'] as String?,
        sexCode = json['sexCode'] as int?,
        accountInfo = (json['accountInfo'] as Map<String, dynamic>?) != null
            ? AccountInfo.fromJson(json['accountInfo'] as Map<String, dynamic>)
            : null,
        avatar = json['avatar'] as String?,
        id = json['id'] as int?,
        displayName = json['displayName'] as String?,
        type = json['type'] as int?,
        deleted = json['deleted'] as bool?,
        phone = json['phone'] as String?,
        phoneCode = json['phoneCode'] as String?,
        email = json['email'] as String?;

  Map<String, dynamic> toJson() => {
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
      };
}

class AccountInfo {
  final bool? isMarshop;
  final int? marshopId;
  final bool? isJa;
  final bool? isChannel;
  final int? level;

  AccountInfo({
    this.isMarshop,
    this.marshopId,
    this.isJa,
    this.isChannel,
    this.level,
  });

  AccountInfo.fromJson(Map<String, dynamic> json)
      : isMarshop = json['isMarshop'] as bool?,
        marshopId = json['marshopId'] as int?,
        isJa = json['isJa'] as bool?,
        isChannel = json['isChannel'] as bool?,
        level = json['level'] as int?;

  Map<String, dynamic> toJson() => {
        'isMarshop': isMarshop,
        'marshopId': marshopId,
        'isJa': isJa,
        'isChannel': isChannel,
        'level': level
      };
}
