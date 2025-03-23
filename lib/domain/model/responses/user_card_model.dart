import 'package:card_markethome/domain/model/index.dart';

class UserCardModel {
  final WalletModel? wallet;

  UserCardModel({
    this.wallet,
  });

  UserCardModel.fromJson(Map<String, dynamic> json)
      : wallet = (json['wallet'] as Map<String, dynamic>?) != null
            ? WalletModel.fromJson(json['wallet'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'wallet': wallet?.toJson()};
}
