import '../index.dart';

class AddressSelectorRepositoryImpl implements AddressSelectorRepository {
  AddressSelectorRepositoryImpl();

  @override
  Future<List<UserAddressModel>> fetchUserAddresses() async {
    try {
      final response = await ApiDioHelper().get(AppUrl.fetchUserAddress);

      final parserData = (response.data as List)
          .map((e) => UserAddressModel.fromJson(e))
          .toList();

      return parserData;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return [];
      } else {}
    }

    return [];
  }

  @override
  Future<List<CountryModel>> fetchCountries() async {
    try {
      final response = await ApiDioHelper().get(AppUrl.fetchCountries);

      final parserData =
          (response.data as List).map((e) => CountryModel.fromJson(e)).toList();

      return parserData;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return [];
      } else {}
    }

    return [];
  }

  @override
  Future<List<ProvinceModel>> fetchProvincesByCountry(int countryId) async {
    try {
      final path = AppUrl.fetchProvinces.replaceFirst(
        "{countryId}",
        countryId.toString(),
      );

      final response = await ApiDioHelper().get(path);

      final parserData = (response.data as List)
          .map((e) => ProvinceModel.fromJson(e))
          .toList();

      return parserData;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return [];
      } else {}
    }

    return [];
  }

  @override
  Future<List<DistrictModel>> fetchDistrictsByProvince(
      String provinceId) async {
    try {
      final path = AppUrl.fetchDistricts.replaceFirst(
        "{provinceId}",
        provinceId.toString(),
      );
      final response = await ApiDioHelper().get(path);

      final parserData = (response.data as List)
          .map((e) => DistrictModel.fromJson(e))
          .toList();

      return parserData;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return [];
      } else {}
    }

    return [];
  }

  @override
  Future<List<WardModel>> fetchWardsByDistrict(String districtId) async {
    try {
      final path = AppUrl.fetchWards.replaceFirst(
        "{districtId}",
        districtId.toString(),
      );

      final response = await ApiDioHelper().get(path);

      final parserData =
          (response.data as List).map((e) => WardModel.fromJson(e)).toList();

      return parserData;
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.statusCode == 404) return [];
      } else {}
    }

    return [];
  }
}
