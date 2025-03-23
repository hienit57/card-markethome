part of 'address_selector_cubit.dart';

class AddressSelectorState extends Equatable {
  const AddressSelectorState({
    this.onFetchCountries = FormzSubmissionStatus.initial,
    this.countries,
    this.countrySlected,
    this.onFetchProvinces = FormzSubmissionStatus.initial,
    this.provinces,
    this.provinceSelected,
    this.onFetchDistricts = FormzSubmissionStatus.initial,
    this.districts,
    this.districtSelected,
    this.onFetchWards = FormzSubmissionStatus.initial,
    this.wards,
    this.wardSelected,
  });

  final FormzSubmissionStatus onFetchCountries;
  final List<CountryModel>? countries;
  final CountryModel? countrySlected;

  final FormzSubmissionStatus onFetchProvinces;
  final List<ProvinceModel>? provinces;
  final ProvinceModel? provinceSelected;

  final FormzSubmissionStatus onFetchDistricts;
  final List<DistrictModel>? districts;
  final DistrictModel? districtSelected;

  final FormzSubmissionStatus onFetchWards;
  final List<WardModel>? wards;
  final WardModel? wardSelected;

  AddressSelectorState copyWith({
    FormzSubmissionStatus? onFetchCountries,
    List<CountryModel>? countries,
    CountryModel? countrySlected,
    FormzSubmissionStatus? onFetchProvinces,
    List<ProvinceModel>? provinces,
    ProvinceModel? provinceSelected,
    FormzSubmissionStatus? onFetchDistricts,
    List<DistrictModel>? districts,
    DistrictModel? districtSelected,
    FormzSubmissionStatus? onFetchWards,
    List<WardModel>? wards,
    WardModel? wardSelected,
  }) {
    return AddressSelectorState(
      onFetchCountries: onFetchCountries ?? this.onFetchCountries,
      countries: countries ?? this.countries,
      countrySlected: countrySlected ?? this.countrySlected,
      onFetchProvinces: onFetchProvinces ?? this.onFetchProvinces,
      provinces: provinces ?? this.provinces,
      provinceSelected: provinceSelected ?? this.provinceSelected,
      onFetchDistricts: onFetchDistricts ?? this.onFetchDistricts,
      districts: districts ?? this.districts,
      districtSelected: districtSelected ?? this.districtSelected,
      onFetchWards: onFetchWards ?? this.onFetchWards,
      wards: wards ?? this.wards,
      wardSelected: wardSelected ?? this.wardSelected,
    );
  }

  @override
  List<Object?> get props => [
        onFetchCountries,
        countries,
        countrySlected,
        onFetchProvinces,
        provinces,
        provinceSelected,
        onFetchDistricts,
        districts,
        districtSelected,
        onFetchWards,
        wards,
        wardSelected,
      ];
}
