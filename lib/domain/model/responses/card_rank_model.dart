class CardRankResponse {
  final CardRankModel? rank;

  CardRankResponse({
    this.rank,
  });

  CardRankResponse.fromJson(Map<String, dynamic> json)
      : rank = (json['rank'] as Map<String, dynamic>?) != null
            ? CardRankModel.fromJson(json['rank'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'rank': rank?.toJson()};
}

class CardRanksResponse {
  final List<CardRankModel>? ranks;

  CardRanksResponse({
    this.ranks,
  });

  CardRanksResponse.fromJson(Map<String, dynamic> json)
      : ranks = (json['ranks'] as List<dynamic>?)
            ?.map((e) => CardRankModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'ranks': ranks?.map((e) => e.toJson()).toList()};
}

class CardRankModel {
  final String? name;
  final String? backgroundUrl;
  final String? description;

  final String? rankTextBackgroundUrl;
  final String? crownImageUrl;
  final String? requiredDOne;

  CardRankModel({
    this.name,
    this.backgroundUrl,
    this.description,
    this.rankTextBackgroundUrl,
    this.crownImageUrl,
    this.requiredDOne,
  });

  CardRankModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        backgroundUrl = json['backgroundUrl'] as String?,
        description = json['description'] as String?,
        rankTextBackgroundUrl = json['rankTextBackgroundUrl'] as String?,
        crownImageUrl = json['crownImageUrl'] as String?,
        requiredDOne = json['requiredDOne'] as String?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'backgroundUrl': backgroundUrl,
        'description': description,
        'rankTextBackgroundUrl': rankTextBackgroundUrl,
        'crownImageUrl': crownImageUrl,
        'requiredDOne': requiredDOne,
      };
}
