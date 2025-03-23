import 'package:card_markethome/domain/model/index.dart';

class CardMarkethomeReponse {
  final List<CardMarkethome>? packs;

  CardMarkethomeReponse({
    this.packs,
  });

  CardMarkethomeReponse.fromJson(Map<String, dynamic> json)
      : packs = (json['packs'] as List?)
            ?.map((dynamic e) =>
                CardMarkethome.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'packs': packs?.map((e) => e.toJson()).toList()};
}

class CardDetailResponse {
  final CardMarkethome? pack;

  CardDetailResponse({
    this.pack,
  });

  CardDetailResponse.fromJson(Map<String, dynamic> json)
      : pack = (json['pack'] as Map<String, dynamic>?) != null
            ? CardMarkethome.fromJson(json['pack'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'pack': pack?.toJson(),
      };
}

class CardMarkethome {
  final CardModel? pack;
  final int? totalPack;
  final int? soldPack;

  CardMarkethome({
    this.pack,
    this.totalPack,
    this.soldPack,
  });

  CardMarkethome.fromJson(Map<String, dynamic> json)
      : pack = (json['pack'] as Map<String, dynamic>?) != null
            ? CardModel.fromJson(json['pack'] as Map<String, dynamic>)
            : null,
        totalPack = json['totalPack'] as int?,
        soldPack = json['soldPack'] as int?;

  Map<String, dynamic> toJson() => {
        'pack': pack?.toJson(),
        'totalPack': totalPack,
        'soldPack': soldPack,
      };
}

class CardModel {
  final int? id;
  final String? name;
  final String? description;
  final int? price;
  final int? dOne;
  final int? extraDOne;
  final int? originalPrice;
  final bool? isActive;
  final int? type;
  final Metadata? metadata;

  CardModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.dOne,
    this.extraDOne,
    this.originalPrice,
    this.isActive,
    this.type,
    this.metadata,
  });

  CardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        description = json['description'] as String?,
        price = json['price'] as int?,
        dOne = json['dOne'] as int?,
        extraDOne = json['extraDOne'] as int?,
        originalPrice = json['originalPrice'] as int?,
        isActive = json['isActive'] as bool?,
        type = json['type'] as int?,
        metadata = (json['metadata'] as Map<String, dynamic>?) != null
            ? Metadata.fromJson(json['metadata'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'dOne': dOne,
        'extraDOne': extraDOne,
        'originalPrice': originalPrice,
        'isActive': isActive,
        'type': type,
        'metadata': metadata?.toJson()
      };
}

extension CardMarkethomeExt on CardModel {
  String get getNameCardMKH => name ?? '';

  int get getPriceCardMKH => originalPrice ?? 0;

  String get getImageCardMKH => metadata?.thumbailUrl ?? '';
}
