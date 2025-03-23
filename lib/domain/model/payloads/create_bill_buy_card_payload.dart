class CreateBillBuyCardPayload {
  final int? packId;
  final int? refererId;
  final int? amount;
  final int? paymentMethod;

  CreateBillBuyCardPayload({
    this.packId,
    this.refererId,
    this.amount,
    this.paymentMethod,
  });

  CreateBillBuyCardPayload.fromJson(Map<String, dynamic> json)
      : packId = json['packId'] as int?,
        refererId = json['refererId'] as int?,
        amount = json['amount'] as int?,
        paymentMethod = json['paymentMethod'] as int?;

  Map<String, dynamic> toJson() => {
        'packId': packId,
        'refererId': refererId,
        'amount': amount,
        'paymentMethod': paymentMethod
      };
}
