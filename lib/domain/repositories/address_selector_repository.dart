import 'package:card_markethome/domain/index.dart';

abstract class AddressSelectorRepository {
  Future<List<UserAddressModel>> fetchUserAddresses();
  Future<List<CountryModel>> fetchCountries();
  Future<List<ProvinceModel>> fetchProvincesByCountry(int countryId);
  Future<List<DistrictModel>> fetchDistrictsByProvince(String provinceId);
  Future<List<WardModel>> fetchWardsByDistrict(String districtId);
}
