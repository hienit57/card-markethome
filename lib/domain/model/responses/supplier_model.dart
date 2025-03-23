import 'package:card_markethome/index.dart';

class SupplierModel {
  final int? id;
  final String? taxCode;
  final String? avatar;
  final String? name;
  final String? company;
  final String? phoneNumber;
  final String? accountCode;

  final int? priceMarketHome;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;
  final String? variantId;
  final String? productId;
  final int? SupplierModelId;
  final int? vstoreId;
  final bool? isMarketHome;

  final int? rootPiceMarketHome;
  final String? variantName;
  final dynamic vatPercentage;

  final List<String>? paymentType;

  final CountryModel? country;
  final ProvinceModel? province;
  final DistrictModel? district;
  final WardModel? ward;

  SupplierModel({
    this.id,
    this.taxCode,
    this.avatar,
    this.name,
    this.company,
    this.phoneNumber,
    this.accountCode,
    this.priceMarketHome,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.variantId,
    this.productId,
    this.SupplierModelId,
    this.vstoreId,
    this.isMarketHome,
    this.paymentType,
    this.rootPiceMarketHome,
    this.vatPercentage,
    this.variantName,
    this.country,
    this.province,
    this.district,
    this.ward,
  });

  SupplierModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        taxCode = json['taxCode'] as String?,
        avatar = json['avatar'] as String?,
        name = json['name'] as String?,
        company = json['company'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        accountCode = json['accountCode'] as String?,
        priceMarketHome = json['priceMarketHome'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        deletedAt = json['deletedAt'],
        variantId = json['variantId'] as String?,
        productId = json['productId'] as String?,
        SupplierModelId = json['SupplierModelId'] as int?,
        vstoreId = json['vstoreId'] as int?,
        isMarketHome = json['isMarketHome'] as bool?,
        paymentType = (json['paymentType'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        rootPiceMarketHome = json['rootPiceMarketHome'] as int?,
        vatPercentage = json['vatPercentage'] as dynamic,
        variantName = json['variantName'] as String?,
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
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'taxCode': taxCode,
        'avatar': avatar,
        'name': name,
        'company': company,
        'phoneNumber': phoneNumber,
        'accountCode': accountCode,
        'priceMarketHome': priceMarketHome,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'variantId': variantId,
        'productId': productId,
        'SupplierModelId': SupplierModelId,
        'vstoreId': vstoreId,
        'isMarketHome': isMarketHome,
        'paymentType': paymentType,
        'rootPiceMarketHome': rootPiceMarketHome,
        'vatPercentage': vatPercentage,
        'variantName': variantName,
        'country': country?.toJson(),
        'province': province?.toJson(),
        'district': district?.toJson(),
        'ward': ward?.toJson(),
      };
}
