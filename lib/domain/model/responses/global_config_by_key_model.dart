class GlobalConfigByKeyReponse {
  final DataByKeyReponse? value;

  GlobalConfigByKeyReponse({
    this.value,
  });

  GlobalConfigByKeyReponse.fromJson(Map<String, dynamic> json)
      : value = (json['value'] as Map<String, dynamic>?) != null
            ? DataByKeyReponse.fromJson(json['value'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'value': value?.toJson()};
}

class DataByKeyReponse {
  final String? image;

  DataByKeyReponse({
    this.image,
  });

  DataByKeyReponse.fromJson(Map<String, dynamic> json)
      : image = json['image'] as String?;

  Map<String, dynamic> toJson() => {'image': image};
}
