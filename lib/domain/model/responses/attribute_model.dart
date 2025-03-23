class AttributeModel {
  final int? id;
  final String? variantId;
  final int? attributeId;
  final String? value;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  final String? name;
  final String? slug;
  final List<DataAttribute>? data;

  AttributeModel({
    this.id,
    this.variantId,
    this.attributeId,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.slug,
    this.data,
  });

  AttributeModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        variantId = json['variantId'] as String?,
        attributeId = json['attributeId'] as int?,
        value = json['value'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        deletedAt = json['deletedAt'],
        name = json['name'] as String?,
        slug = json['slug'] as String?,
        data = (json['data'] as List?)
            ?.map((dynamic e) =>
                DataAttribute.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'variantId': variantId,
        'attributeId': attributeId,
        'value': value,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'deletedAt': deletedAt,
        'name': name,
        'slug': slug,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

extension DataAttributeExt on DataAttribute {
  // String get thumbnailAttribute {
  //   if (thumbnail?.isNotEmpty ?? true) {
  //     return thumbnail!.first;
  //   }
  //   return Assets.lib_assets_images_banner_big_sale.path;
  // }
}

class DataAttribute {
  final int? id;
  final String? name;
  final int? attributeId;
  final List<String>? thumbnail;
  bool? isSelected;

  DataAttribute({
    this.id,
    this.name,
    this.attributeId,
    this.thumbnail,
    this.isSelected,
  });

  DataAttribute.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        attributeId = json['attributeId'] as int?,
        thumbnail = (json['thumbnail'] as List?)
            ?.map((dynamic e) => e as String)
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'attributeId': attributeId,
        'thumbnail': thumbnail,
      };
}
