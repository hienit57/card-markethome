import 'package:card_markethome/domain/index.dart';

class AddressSelectorUsecase {
  AddressSelectorUsecase({
    required AddressSelectorRepository repository,
  }) : _addressSelectorRepository = repository;

  final AddressSelectorRepository _addressSelectorRepository;

  Future<List<UserAddressModel>> fetchUserAddresses() async =>
      await _addressSelectorRepository.fetchUserAddresses();

  Future<List<CountryModel>> fetchCountries() async =>
      await _addressSelectorRepository.fetchCountries();

  Future<List<ProvinceModel>> fetchProvincesByCountry(int countryId) async =>
      await _addressSelectorRepository.fetchProvincesByCountry(countryId);

  Future<List<DistrictModel>> fetchDistrictsByProvince(
          String provinceId) async =>
      await _addressSelectorRepository.fetchDistrictsByProvince(provinceId);

  Future<List<WardModel>> fetchWardsByDistrict(String districtId) async =>
      await _addressSelectorRepository.fetchWardsByDistrict(districtId);
}
