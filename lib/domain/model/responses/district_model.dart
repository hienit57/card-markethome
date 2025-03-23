class DistrictModel {
  final String? id;
  final String? name;
  final String? latitude;
  final String? longitude;
  final dynamic wikiDataId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final String? provinceId;
  final String? ghnId;

  DistrictModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.wikiDataId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.provinceId,
    this.ghnId,
  });

  DistrictModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        wikiDataId = json['wikiDataId'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        deletedAt = json['deletedAt'],
        provinceId = json['provinceId'] as String?,
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
        'provinceId': provinceId,
        'ghnId': ghnId
      }..removeWhere((key, value) => value == null);
}
