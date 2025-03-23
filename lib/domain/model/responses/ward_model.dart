class WardModel {
  final String? id;
  final String? name;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic wikiDataId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final String? districtId;
  final String? ghnId;

  WardModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.wikiDataId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.districtId,
    this.ghnId,
  });

  WardModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        latitude = json['latitude'],
        longitude = json['longitude'],
        wikiDataId = json['wikiDataId'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        deletedAt = json['deletedAt'],
        districtId = json['districtId'] as String?,
        ghnId = json['ghnId'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'wikiDataId': wikiDataId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'districtId': districtId,
        'ghnId': ghnId
      }..removeWhere((key, value) => value == null);
}
