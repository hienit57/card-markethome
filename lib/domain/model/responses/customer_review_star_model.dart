class CustomerReviewStar {
  final StarReviewModel? oneStar;
  final StarReviewModel? twoStar;
  final StarReviewModel? threeStar;
  final StarReviewModel? fourStar;
  final StarReviewModel? fiveStar;

  CustomerReviewStar({
    this.oneStar,
    this.twoStar,
    this.threeStar,
    this.fourStar,
    this.fiveStar,
  });

  CustomerReviewStar.fromJson(Map<String, dynamic> json)
      : oneStar = (json['oneStar'] as Map<String, dynamic>?) != null
            ? StarReviewModel.fromJson(json['oneStar'] as Map<String, dynamic>)
            : null,
        twoStar = (json['twoStar'] as Map<String, dynamic>?) != null
            ? StarReviewModel.fromJson(json['twoStar'] as Map<String, dynamic>)
            : null,
        threeStar = (json['threeStar'] as Map<String, dynamic>?) != null
            ? StarReviewModel.fromJson(
                json['threeStar'] as Map<String, dynamic>)
            : null,
        fourStar = (json['fourStar'] as Map<String, dynamic>?) != null
            ? StarReviewModel.fromJson(json['fourStar'] as Map<String, dynamic>)
            : null,
        fiveStar = (json['fiveStar'] as Map<String, dynamic>?) != null
            ? StarReviewModel.fromJson(json['fiveStar'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'oneStar': oneStar?.toJson(),
        'twoStar': twoStar?.toJson(),
        'threeStar': threeStar?.toJson(),
        'fourStar': fourStar?.toJson(),
        'fiveStar': fiveStar?.toJson()
      };
}

extension CustomerReviewStarExt on CustomerReviewStar {
  double get rattingProduct {
    double count = 0;

    int totalRatting = oneStar!.quantity! +
        twoStar!.quantity! +
        threeStar!.quantity! +
        fourStar!.quantity! +
        fiveStar!.quantity!;

    if (totalRatting > 0) {
      count = (oneStar!.quantity! / totalRatting) +
          2 * (twoStar!.quantity! / totalRatting) +
          3 * (threeStar!.quantity! / totalRatting) +
          4 * (fourStar!.quantity! / totalRatting) +
          5 * (fiveStar!.quantity! / totalRatting);
    }

    if (count > 0 && count < 1) {
      return 1;
    }

    return count;
  }
}

class StarReviewModel {
  final int? quantity;

  StarReviewModel({
    this.quantity,
  });

  StarReviewModel.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() => {'quantity': quantity};
}
