import 'package:card_markethome/domain/index.dart';

class AgencyCardMKHReponse {
  final List<AgencyModel>? agencies;
  final int? total;

  AgencyCardMKHReponse({
    this.agencies,
    this.total,
  });

  AgencyCardMKHReponse.fromJson(Map<String, dynamic> json)
      : agencies = (json['agencies'] as List?)
            ?.map(
                (dynamic e) => AgencyModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        total = json['total'] as int?;

  Map<String, dynamic> toJson() =>
      {'agencies': agencies?.map((e) => e.toJson()).toList(), 'total': total};
}

class AgencyModel {
  final UserProfileModel? user;
  final int? totalDOne;
  final int? holdingDOne;
  final String? email;
  final String? taxCode;
  final String? address;
  final String? addressNote;
  final String? phone;
  final String? phoneCode;
  final int? status;
  final bool? isActive;
  final String? createdAt;
  final int? refererCommissionRate;
  final int? id;
  final String? name;
  final Stats? stats;

  AgencyModel({
    this.user,
    this.totalDOne,
    this.holdingDOne,
    this.email,
    this.taxCode,
    this.address,
    this.addressNote,
    this.phone,
    this.phoneCode,
    this.status,
    this.isActive,
    this.createdAt,
    this.refererCommissionRate,
    this.id,
    this.name,
    this.stats,
  });

  AgencyModel.fromJson(Map<String, dynamic> json)
      : user = (json['user'] as Map<String, dynamic>?) != null
            ? UserProfileModel.fromJson(json['user'] as Map<String, dynamic>)
            : null,
        totalDOne = json['totalDOne'] as int?,
        holdingDOne = json['holdingDOne'] as int?,
        email = json['email'] as String?,
        taxCode = json['taxCode'] as String?,
        address = json['address'] as String?,
        addressNote = json['addressNote'] as String?,
        phone = json['phone'] as String?,
        phoneCode = json['phoneCode'] as String?,
        status = json['status'] as int?,
        isActive = json['isActive'] as bool?,
        createdAt = json['createdAt'] as String?,
        refererCommissionRate = json['refererCommissionRate'] as int?,
        id = json['id'] as int?,
        name = json['name'] as String?,
        stats = (json['stats'] as Map<String, dynamic>?) != null
            ? Stats.fromJson(json['stats'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'user': user?.toJson(),
        'totalDOne': totalDOne,
        'holdingDOne': holdingDOne,
        'email': email,
        'taxCode': taxCode,
        'address': address,
        'addressNote': addressNote,
        'phone': phone,
        'phoneCode': phoneCode,
        'status': status,
        'isActive': isActive,
        'createdAt': createdAt,
        'refererCommissionRate': refererCommissionRate,
        'id': id,
        'name': name,
        'stats': stats?.toJson()
      };
}

class Stats {
  final bool? hasTransacted;

  Stats({
    this.hasTransacted,
  });

  Stats.fromJson(Map<String, dynamic> json)
      : hasTransacted = json['hasTransacted'] as bool?;

  Map<String, dynamic> toJson() => {'hasTransacted': hasTransacted};
}
