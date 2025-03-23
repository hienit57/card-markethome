class ProvinceModel {
  final String? id;
  final String? name;
  final dynamic latitude;
  final dynamic longitude;
  final String? ghnId;
  final dynamic wikiDataId;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final int? countryId;

  ProvinceModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.ghnId,
    this.wikiDataId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.countryId,
  });

  ProvinceModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        latitude = json['latitude'],
        longitude = json['longitude'],
        ghnId = json['ghnId'] as String?,
        wikiDataId = json['wikiDataId'],
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        deletedAt = json['deletedAt'],
        countryId = json['countryId'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'latitude': latitude,
        'longitude': longitude,
        'ghnId': ghnId,
        'wikiDataId': wikiDataId,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'countryId': countryId
      };
}
