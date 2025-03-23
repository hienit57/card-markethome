class CreateRequestBuyCardPayload {
  final String? billId;
  final int? bankAccountId;
  final BuyerInforPayload? voucherPackBuyerInfo;

  CreateRequestBuyCardPayload({
    this.billId,
    this.bankAccountId,
    this.voucherPackBuyerInfo,
  });

  CreateRequestBuyCardPayload.fromJson(Map<String, dynamic> json)
      : billId = json['billId'] as String?,
        bankAccountId = json['bankAccountId'] as int?,
        voucherPackBuyerInfo =
            (json['voucherPackBuyerInfo'] as Map<String, dynamic>?) != null
                ? BuyerInforPayload.fromJson(
                    json['voucherPackBuyerInfo'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'billId': billId,
        'bankAccountId': bankAccountId,
        'BuyerInforPayload': voucherPackBuyerInfo?.toJson()
      };
}

class BuyerInforPayload {
  final String? fullName;
  final String? vdoneID;
  final String? phoneNumber;
  final String? email;
  final String? country;
  final String? province;
  final String? district;
  final String? ward;
  final String? address;

  BuyerInforPayload({
    this.fullName,
    this.vdoneID,
    this.phoneNumber,
    this.email,
    this.country,
    this.province,
    this.district,
    this.ward,
    this.address,
  });

  BuyerInforPayload.fromJson(Map<String, dynamic> json)
      : fullName = json['fullName'] as String?,
        vdoneID = json['vdoneID'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        email = json['email'] as String?,
        country = json['country'] as String?,
        province = json['province'] as String?,
        district = json['district'] as String?,
        ward = json['ward'] as String?,
        address = json['address'] as String?;

  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'vdoneID': vdoneID,
        'phoneNumber': phoneNumber,
        'email': email,
        'country': country,
        'province': province,
        'district': district,
        'ward': ward,
        'address': address
      };
}
