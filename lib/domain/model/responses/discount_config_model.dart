class DiscountConfigModel {
  final dynamic vDoneRate;
  final dynamic vstoreRate;
  final dynamic marshopRate;
  final dynamic shopWarehouseRate;

  DiscountConfigModel({
    this.vDoneRate,
    this.vstoreRate,
    this.marshopRate,
    this.shopWarehouseRate,
  });

  DiscountConfigModel.fromJson(Map<String, dynamic> json)
      : vDoneRate = json['vDoneRate'],
        vstoreRate = json['vstoreRate'],
        marshopRate = json['marshopRate'],
        shopWarehouseRate = json['shopWarehouseRate'];

  Map<String, dynamic> toJson() => {
        'vDoneRate': vDoneRate,
        'vstoreRate': vstoreRate,
        'marshopRate': marshopRate,
        'shopWarehouseRate': shopWarehouseRate
      };
}
