class Metadata {
  final String? thumbailUrl;
  final String? tag;
  final double? discountRate;
  final int? creditCardDiscountRate;

  Metadata({
    this.thumbailUrl,
    this.tag,
    this.discountRate,
    this.creditCardDiscountRate,
  });

  Metadata.fromJson(Map<String, dynamic> json)
      : thumbailUrl = json['thumbailUrl'] as String?,
        tag = json['tag'] as String?,
        discountRate = json['discountRate'] as double?,
        creditCardDiscountRate = json['creditCardDiscountRate'] as int?;

  Map<String, dynamic> toJson() => {
        'thumbailUrl': thumbailUrl,
        'tag': tag,
        'discountRate': discountRate,
        'creditCardDiscountRate': creditCardDiscountRate
      };
}
