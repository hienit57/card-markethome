import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

class RicebookPackageModel {
  final String? id;
  final String? name;
  final List<String>? thumbnail;
  final dynamic customerRating;
  final dynamic customerReviewCount;

  final String? productType;
  final dynamic productDetail;
  final dynamic productSummary;
  final dynamic productVideo;
  final String? productBrand;
  final String? productMaterial;
  final List<SupplierVariants>? supplierVariants;

  final List<AttributeModel>? attributes;

  final SupplierModel? supplier;

  RicebookPackageModel({
    this.id,
    this.name,
    this.thumbnail,
    this.customerRating,
    this.customerReviewCount,
    this.productType,
    this.productDetail,
    this.productSummary,
    this.productVideo,
    this.productBrand,
    this.productMaterial,
    this.supplierVariants,
    this.attributes,
    this.supplier,
  });

  RicebookPackageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        thumbnail = (json['thumbnail'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        customerRating = json['customerRating'],
        customerReviewCount = json['customerReviewCount'],
        productType = json['productType'] as String?,
        productDetail = json['productDetail'],
        productSummary = json['productSummary'],
        productVideo = json['productVideo'],
        productBrand = json['productBrand'] as String?,
        productMaterial = json['productMaterial'] as String?,
        supplierVariants = (json['supplierVariants'] as List?)
            ?.map((dynamic e) =>
                SupplierVariants.fromJson(e as Map<String, dynamic>))
            .toList(),
        attributes = (json['attributes'] as List?)
            ?.map((dynamic e) =>
                AttributeModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        supplier = (json['supplier'] as Map<String, dynamic>?) != null
            ? SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail': thumbnail,
        'customerRating': customerRating,
        'customerReviewCount': customerReviewCount,
        'productType': productType,
        'productDetail': productDetail,
        'productSummary': productSummary,
        'productVideo': productVideo,
        'productBrand': productBrand,
        'productMaterial': productMaterial,
        'supplierVariants': supplierVariants?.map((e) => e.toJson()).toList(),
        'attributes': attributes?.map((e) => e.toJson()).toList(),
        'supplier': supplier?.toJson(),
      };
}

extension RicebookPackageModelExt on RicebookPackageModel {
  SupplierVariants get getVariantView {
    if (supplierVariants?.isNotEmpty ?? false) {
      if ((supplierVariants?.length ?? 0) > 1) {
        return supplierVariants!.reduce((curr, next) =>
            (curr.markethomePrice ?? 0) < (next.markethomePrice ?? 0)
                ? curr
                : next);
      }
      return supplierVariants!.first;
    }
    return SupplierVariants();
  }

  int get totalMarketHomeSoldCount {
    if (supplierVariants?.isEmpty ?? true) {
      return 0;
    }
    return (supplierVariants ?? [])
        .map((e) => e.markethomeSoldCount ?? 0)
        .reduce((a, b) => a + b);
  }

  List<String> get listImageProductView {
    List<String> listValue = [];
    listValue.addAll(thumbnail ?? []);

    supplierVariants?.forEach((element) {
      listValue.addAll(element.variant?.thumbnail ?? []);
    });
    if (productVideo != null) {
      listValue.add(productVideo);
    }

    return listValue;
  }

  String rootPriceFluctuates() {
    if (supplierVariants?.isEmpty ?? true) {
      return '';
    }

    int minPrice = supplierVariants?[0].markethomeRootPrice ?? 0;
    int maxPrice = supplierVariants?[0].markethomeRootPrice ?? 0;

    for (var item in supplierVariants!) {
      int currentPrice = item.markethomeRootPrice ?? 0;
      if (currentPrice < minPrice) {
        minPrice = currentPrice;
      }
      if (currentPrice > maxPrice) {
        maxPrice = currentPrice;
      }
    }
    if (minPrice == maxPrice) {
      return minPrice.toAppCurrencyString(isWithSymbol: true);
    }

    return '${minPrice.toAppCurrencyString(isWithSymbol: true)} - ${maxPrice.toAppCurrencyString(isWithSymbol: true)}';
  }

  String priceFluctuates() {
    if (supplierVariants?.isEmpty ?? true) {
      return '';
    }

    // final supplierVariantsAvaiable = supplierVariants?.where((element) {
    //       final sellingProductCount = element.sellingProductCount ?? 0;
    //       return sellingProductCount > 0;
    //     }).toList() ??
    //     [];

    // if (supplierVariants.isEmpty) {
    //   return supplierVariants!.first.markethomePrice.toAppCurrencyString();
    // }

    int minPrice = supplierVariants?[0].markethomePrice ?? 0;
    int maxPrice = supplierVariants?[0].markethomePrice ?? 0;

    for (var item in supplierVariants!) {
      int currentPrice = item.markethomePrice ?? 0;
      if (currentPrice < minPrice) {
        minPrice = currentPrice;
      }
      if (currentPrice > maxPrice) {
        maxPrice = currentPrice;
      }
    }
    if (minPrice == maxPrice) {
      return minPrice.toAppCurrencyString(isWithSymbol: true);
    }

    return '${minPrice.toAppCurrencyString(isWithSymbol: true)} - ${maxPrice.toAppCurrencyString(isWithSymbol: true)}';
  }
}

class SupplierVariants {
  final int? id;
  final int? markethomePrice;
  final int? markethomeRootPrice;
  final String? variantId;
  final Variant? variant;
  final String? productId;
  final int? supplierId;
  final SupplierModel? supplier;
  final bool? isMarkethomeProduct;
  final bool? isCertProduct;
  final int? sellingProductCount;
  final List<String>? allowedPaymentTypes;
  final List<String>? allowedCustomerTypes;
  final List<String>? allowedShippingMethods;
  final CustomerReviewStar? customerReviewStat;
  final int? markethomeSoldCount;
  final int? certSoldCount;
  final String? createdAt;
  final String? updatedAt;
  final DiscountConfigModel? discountConfig;

  final int? resolvedDOneCertPrice;
  final int? resolvedDOneCertVatAmount;
  final int? certSalableProductCount;
  final List<String>? certAllowedCustomerTypes;
  final List<String>? certAllowedShippingMethods;

  SupplierVariants({
    this.id,
    this.markethomePrice,
    this.markethomeRootPrice,
    this.variantId,
    this.variant,
    this.productId,
    this.supplierId,
    this.supplier,
    this.isMarkethomeProduct,
    this.isCertProduct,
    this.sellingProductCount,
    this.allowedPaymentTypes,
    this.allowedCustomerTypes,
    this.allowedShippingMethods,
    this.customerReviewStat,
    this.markethomeSoldCount,
    this.certSoldCount,
    this.createdAt,
    this.updatedAt,
    this.discountConfig,
    this.resolvedDOneCertPrice,
    this.resolvedDOneCertVatAmount,
    this.certSalableProductCount,
    this.certAllowedCustomerTypes,
    this.certAllowedShippingMethods,
  });

  SupplierVariants.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        markethomePrice = json['markethomePrice'] as int?,
        markethomeRootPrice = json['markethomeRootPrice'] as int?,
        variantId = json['variantId'] as String?,
        variant = (json['variant'] as Map<String, dynamic>?) != null
            ? Variant.fromJson(json['variant'] as Map<String, dynamic>)
            : null,
        productId = json['productId'] as String?,
        supplierId = json['supplierId'] as int?,
        supplier = (json['supplier'] as Map<String, dynamic>?) != null
            ? SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>)
            : null,
        isMarkethomeProduct = json['isMarkethomeProduct'] as bool?,
        isCertProduct = json['isCertProduct'] as bool?,
        sellingProductCount = json['sellingProductCount'] as int?,
        allowedPaymentTypes = (json['allowedPaymentTypes'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        allowedCustomerTypes = (json['allowedCustomerTypes'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        allowedShippingMethods = (json['allowedShippingMethods'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        customerReviewStat =
            (json['customerReviewStat'] as Map<String, dynamic>?) != null
                ? CustomerReviewStar.fromJson(
                    json['customerReviewStat'] as Map<String, dynamic>)
                : null,
        markethomeSoldCount = json['markethomeSoldCount'] as int?,
        certSoldCount = json['certSoldCount'] as int?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        discountConfig =
            (json['discountConfig'] as Map<String, dynamic>?) != null
                ? DiscountConfigModel.fromJson(
                    json['discountConfig'] as Map<String, dynamic>)
                : null,
        resolvedDOneCertPrice = json['resolvedDOneCertPrice'] as int?,
        resolvedDOneCertVatAmount = json['resolvedDOneCertVatAmount'] as int?,
        certSalableProductCount = json['certSalableProductCount'] as int?,
        certAllowedCustomerTypes = (json['certAllowedCustomerTypes'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        certAllowedShippingMethods =
            (json['certAllowedShippingMethods'] as List?)
                ?.map((dynamic e) => e as String)
                .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'markethomePrice': markethomePrice,
        'markethomeRootPrice': markethomeRootPrice,
        'variantId': variantId,
        'variant': variant?.toJson(),
        'productId': productId,
        'supplierId': supplierId,
        'supplier': supplier?.toJson(),
        'isMarkethomeProduct': isMarkethomeProduct,
        'isCertProduct': isCertProduct,
        'sellingProductCount': sellingProductCount,
        'allowedPaymentTypes': allowedPaymentTypes,
        'allowedCustomerTypes': allowedCustomerTypes,
        'allowedShippingMethods': allowedShippingMethods,
        'customerReviewStat': customerReviewStat?.toJson(),
        'markethomeSoldCount': markethomeSoldCount,
        'certSoldCount': certSoldCount,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'discountConfig': discountConfig?.toJson(),
        'resolvedDOneCertPrice': resolvedDOneCertPrice,
        'resolvedDOneCertVatAmount': resolvedDOneCertVatAmount,
        'certSalableProductCount': certSalableProductCount,
        'certAllowedCustomerTypes': certAllowedCustomerTypes,
        'certAllowedShippingMethods': certAllowedShippingMethods,
      };
}

extension SupplierVariantsExt on SupplierVariants {
  String get getPriceProduct =>
      markethomePrice.toAppCurrencyString(isWithSymbol: false);

  String get getRootPriceProduct => markethomeRootPrice.toAppCurrencyString();

  int get percentDiscount {
    double percent = 0;

    final int parserMarkethomePrice = markethomePrice ?? 0;

    final int parserMarkethomeRootPrice = markethomeRootPrice ?? 0;

    if (parserMarkethomeRootPrice != 0) {
      percent = (1 - parserMarkethomePrice / parserMarkethomeRootPrice) * 100;
    }

    return percent.toInt();
  }

  int get savedAmount => (markethomeRootPrice ?? 0) - (markethomePrice ?? 0);

  int get getMarshopDiscount =>
      ((discountConfig?.marshopRate ?? 0) * 100).ceil();

  int get totalDOneProductPrice =>
      (resolvedDOneCertPrice ?? 0) + (resolvedDOneCertVatAmount ?? 0);
}

class Variant {
  final String? id;
  final String? name;
  final List<String>? thumbnail;
  final dynamic longs;
  final dynamic width;
  final dynamic height;
  final dynamic weight;
  final dynamic volume;

  final List<AttributeModel>? attributes;

  Variant({
    this.id,
    this.name,
    this.thumbnail,
    this.longs,
    this.width,
    this.height,
    this.weight,
    this.volume,
    this.attributes,
  });

  Variant.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        name = json['name'] as String?,
        thumbnail = (json['thumbnail'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        longs = json['longs'],
        width = json['width'],
        height = json['height'],
        weight = json['weight'],
        volume = json['volume'],
        attributes = (json['attributes'] as List?)
            ?.map((dynamic e) =>
                AttributeModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'thumbnail': thumbnail,
        'longs': longs,
        'width': width,
        'height': height,
        'weight': weight,
        'volume': volume,
        'attributes': attributes?.map((e) => e.toJson()).toList(),
      };
}
