import 'package:card_markethome/index.dart';

class PackagesRiceBookResponse {
  PackagesRiceBookResponse({
    this.certProducts,
    this.total,
  });

  PackagesRiceBookResponse.fromJson(Map<String, dynamic> json)
      : certProducts = (json['certProducts'] as List?)
            ?.map((dynamic e) =>
                RicebookPackageModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        total = json['total'] as int?;

  final List<RicebookPackageModel>? certProducts;
  final int? total;

  Map<String, dynamic> toJson() => {
        'certProducts': certProducts?.map((e) => e.toJson()).toList(),
        'total': total,
      };
}
