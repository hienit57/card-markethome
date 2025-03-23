import 'package:card_markethome/index.dart';

class MarshopsReponse {
  final int? total;
  final List<MarshopModel>? marshops;

  MarshopsReponse({
    this.total,
    this.marshops,
  });

  MarshopsReponse.fromJson(Map<String, dynamic> json)
      : total = json['total'] as int?,
        marshops = (json['marshops'] as List?)
            ?.map(
                (dynamic e) => MarshopModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'total': total,
        'marshops': marshops?.map((e) => e.toJson()).toList(),
      };
}

class MarshopModel {
  final int? id;
  final String? code;
  final int? status;
  final int? depositStatus;
  final String? createdAt;
  final UserProfileModel? user;
  final PackInfo? packInfo;

  MarshopModel({
    this.id,
    this.code,
    this.status,
    this.depositStatus,
    this.createdAt,
    this.user,
    this.packInfo,
  });

  MarshopModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        code = json['code'] as String?,
        status = json['status'] as int?,
        depositStatus = json['depositStatus'] as int?,
        createdAt = json['createdAt'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? UserProfileModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        packInfo = (json['packInfo'] as Map<String, dynamic>?) != null
            ? PackInfo.fromJson(json['packInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'status': status,
        'depositStatus': depositStatus,
        'createdAt': createdAt,
        'user': user?.toJson(),
        'packInfo': packInfo?.toJson()
      };
}

class PackInfo {
  final int? packType;
  final BillInfo? billInfo;

  PackInfo({
    this.packType,
    this.billInfo,
  });

  PackInfo.fromJson(Map<String, dynamic> json)
      : packType = json['packType'] as int?,
        billInfo = (json['billInfo'] as Map<String, dynamic>?) != null
            ? BillInfo.fromJson(json['billInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'packType': packType, 'billInfo': billInfo?.toJson()};
}

class BillInfo {
  final AddressInfo? addressInfo;

  BillInfo({
    this.addressInfo,
  });

  BillInfo.fromJson(Map<String, dynamic> json)
      : addressInfo = (json['addressInfo'] as Map<String, dynamic>?) != null
            ? AddressInfo.fromJson(json['addressInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'addressInfo': addressInfo?.toJson()};
}

class AddressInfo {
  final String? countryName;
  final String? provinceName;
  final String? districtName;
  final String? wardName;
  final String? address;

  AddressInfo({
    this.countryName,
    this.provinceName,
    this.districtName,
    this.wardName,
    this.address,
  });

  AddressInfo.fromJson(Map<String, dynamic> json)
      : countryName = json['countryName'] as String?,
        provinceName = json['provinceName'] as String?,
        districtName = json['districtName'] as String?,
        wardName = json['wardName'] as String?,
        address = json['address'] as String?;

  Map<String, dynamic> toJson() => {
        'countryName': countryName,
        'provinceName': provinceName,
        'districtName': districtName,
        'wardName': wardName,
        'address': address
      };
}
