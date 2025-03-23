class BankAccountModel {
  final int? id;
  final int? userId;
  final String? bankNumber;
  final String? bankHolder;
  final dynamic qrImage;
  final bool? isDefault;
  final String? createdAt;
  final Bank? bank;

  BankAccountModel({
    this.id,
    this.userId,
    this.bankNumber,
    this.bankHolder,
    this.qrImage,
    this.isDefault,
    this.createdAt,
    this.bank,
  });

  BankAccountModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['userId'] as int?,
        bankNumber = json['bankNumber'] as String?,
        bankHolder = json['bankHolder'] as String?,
        qrImage = json['qrImage'],
        isDefault = json['isDefault'] as bool?,
        createdAt = json['createdAt'] as String?,
        bank = (json['bank'] as Map<String, dynamic>?) != null
            ? Bank.fromJson(json['bank'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'bankNumber': bankNumber,
        'bankHolder': bankHolder,
        'qrImage': qrImage,
        'isDefault': isDefault,
        'createdAt': createdAt,
        'bank': bank?.toJson()
      };
}

class Bank {
  final int? id;
  final String? name;
  final String? logo;
  final String? code;
  final String? shortName;

  Bank({
    this.id,
    this.name,
    this.logo,
    this.code,
    this.shortName,
  });

  Bank.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        logo = json['logo'] as String?,
        code = json['code'] as String?,
        shortName = json['shortName'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'logo': logo,
        'code': code,
        'shortName': shortName
      };
}
