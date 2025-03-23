import 'package:card_markethome/domain/index.dart';

class BillModel {
  final String? billId;
  final BankAccountModel? bankAccount;
  final int? vndAmount;
  final String? content;
  final String? refererCommission;

  BillModel({
    this.billId,
    this.bankAccount,
    this.vndAmount,
    this.content,
    this.refererCommission,
  });

  BillModel.fromJson(Map<String, dynamic> json)
      : billId = json['billId'] as String?,
        bankAccount = (json['bankAccount'] as Map<String, dynamic>?) != null
            ? BankAccountModel.fromJson(
                json['bankAccount'] as Map<String, dynamic>)
            : null,
        vndAmount = json['vndAmount'] as int?,
        content = json['content'] as String?,
        refererCommission = json['refererCommission'] as String?;

  Map<String, dynamic> toJson() => {
        'billId': billId,
        'bankAccount': bankAccount?.toJson(),
        'vndAmount': vndAmount,
        'content': content,
        'refererCommission': refererCommission
      };
}
