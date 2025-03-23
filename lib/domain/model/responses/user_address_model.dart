import 'package:card_markethome/domain/index.dart';

class UserAddressModel {
  final String? id;
  final String? name;
  final int? type;
  final String? address;
  final String? telephone;
  final String? email;
  final bool? isDefault;
  final String? note;
  final CountryModel? country;
  final ProvinceModel? province;
  final DistrictModel? district;
  final WardModel? ward;
  final String? createdAt;

  UserAddressModel({
    this.id,
    this.name,
    this.type,
    this.address,
    this.telephone,
    this.email,
    this.isDefault,
    this.note,
    this.country,
    this.province,
    this.district,
    this.ward,
    this.createdAt,
  });

  UserAddressModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        type = json['type'] as int?,
        address = json['address'] as String?,
        telephone = json['telephone'] as String?,
        email = json['email'] as String?,
        isDefault = json['isDefault'] as bool?,
        note = json['note'] as String?,
        country = (json['country'] as Map<String, dynamic>?) != null
            ? CountryModel.fromJson(json['country'] as Map<String, dynamic>)
            : null,
        province = (json['province'] as Map<String, dynamic>?) != null
            ? ProvinceModel.fromJson(json['province'] as Map<String, dynamic>)
            : null,
        district = (json['district'] as Map<String, dynamic>?) != null
            ? DistrictModel.fromJson(json['district'] as Map<String, dynamic>)
            : null,
        ward = (json['ward'] as Map<String, dynamic>?) != null
            ? WardModel.fromJson(json['ward'] as Map<String, dynamic>)
            : null,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type,
        'address': address,
        'telephone': telephone,
        'email': email,
        'isDefault': isDefault,
        'note': note,
        'country': country?.toJson(),
        'province': province?.toJson(),
        'district': district?.toJson(),
        'ward': ward?.toJson(),
        'createdAt': createdAt
      };
}

extension PersonalAddressExt on UserAddressModel {
  String get getAddress {
    List<String> personalAddress = [
      ward?.name ?? '',
      district?.name ?? '',
      province?.name ?? '',
      country?.name ?? '',
    ];
    return personalAddress.join(', ');
  }
}
