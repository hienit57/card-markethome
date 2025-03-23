import 'package:card_markethome/domain/model/index.dart';

class WalletModel {
  final int? id;
  final String? dOne;
  final String? givingDOne;
  final UserProfileModel? user;
  final CardRankModel? rank;
  final UserProfileModel? buyerInfo;

  WalletModel({
    this.id,
    this.dOne,
    this.givingDOne,
    this.user,
    this.rank,
    this.buyerInfo,
  });

  WalletModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        dOne = json['dOne'] as String?,
        givingDOne = json['givingDOne'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null
            ? UserProfileModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        rank = (json['rank'] as Map<String, dynamic>?) != null
            ? CardRankModel.fromJson(json['rank'] as Map<String, dynamic>)
            : null,
        buyerInfo = (json['buyerInfo'] as Map<String, dynamic>?) != null
            ? UserProfileModel.fromJson(
                json['buyerInfo'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'dOne': dOne,
        'givingDOne': givingDOne,
        'user': user?.toJson(),
        'rank': rank?.toJson(),
        'buyerInfo': buyerInfo?.toJson()
      };
}
