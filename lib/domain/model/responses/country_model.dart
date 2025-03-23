class CountryModel {
  final int? id;
  final String? name;
  final String? iso3;
  final String? iso2;
  final String? numericCode;
  final String? phoneCode;
  final String? capital;
  final String? currency;
  final String? currencyName;
  final String? currencySymbol;
  final String? tld;
  final String? native;
  final String? region;
  final String? subregion;
  final String? emoji;
  final String? emojiU;
  final String? timezones;
  final String? translations;
  final String? latitude;
  final String? longitude;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;

  CountryModel({
    this.id,
    this.name,
    this.iso3,
    this.iso2,
    this.numericCode,
    this.phoneCode,
    this.capital,
    this.currency,
    this.currencyName,
    this.currencySymbol,
    this.tld,
    this.native,
    this.region,
    this.subregion,
    this.emoji,
    this.emojiU,
    this.timezones,
    this.translations,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  CountryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        iso3 = json['iso3'] as String?,
        iso2 = json['iso2'] as String?,
        numericCode = json['numericCode'] as String?,
        phoneCode = json['phoneCode'] as String?,
        capital = json['capital'] as String?,
        currency = json['currency'] as String?,
        currencyName = json['currencyName'] as String?,
        currencySymbol = json['currencySymbol'] as String?,
        tld = json['tld'] as String?,
        native = json['native'] as String?,
        region = json['region'] as String?,
        subregion = json['subregion'] as String?,
        emoji = json['emoji'] as String?,
        emojiU = json['emojiU'] as String?,
        timezones = json['timezones'] as String?,
        translations = json['translations'] as String?,
        latitude = json['latitude'] as String?,
        longitude = json['longitude'] as String?,
        createdAt = json['createdAt'],
        updatedAt = json['updatedAt'],
        deletedAt = json['deletedAt'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'iso3': iso3,
        'iso2': iso2,
        'numericCode': numericCode,
        'phoneCode': phoneCode,
        'capital': capital,
        'currency': currency,
        'currencyName': currencyName,
        'currencySymbol': currencySymbol,
        'tld': tld,
        'native': native,
        'region': region,
        'subregion': subregion,
        'emoji': emoji,
        'emojiU': emojiU,
        'timezones': timezones,
        'translations': translations,
        'latitude': latitude,
        'longitude': longitude,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt
      };
}
