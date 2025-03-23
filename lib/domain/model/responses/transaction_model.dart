class TransactionModel {
  final int? dOne;
  final int? transactionId;
  final String? createdAt;

  TransactionModel({
    this.dOne,
    this.transactionId,
    this.createdAt,
  });

  TransactionModel.fromJson(Map<String, dynamic> json)
      : dOne = json['dOne'] as int?,
        transactionId = json['transactionId'] as int?,
        createdAt = json['createdAt'] as String?;

  Map<String, dynamic> toJson() =>
      {'dOne': dOne, 'transactionId': transactionId, 'createdAt': createdAt};
}
