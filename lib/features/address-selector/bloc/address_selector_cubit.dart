import 'package:card_markethome/index.dart';

part 'address_selector_state.dart';

class AddressSelectorCubit extends Cubit<AddressSelectorState> {
  AddressSelectorCubit({
    required AddressSelectorUsecase addressSelectorUsecase,
  })  : _addressSelectorUsecase = addressSelectorUsecase,
        super(const AddressSelectorState());

  final AddressSelectorUsecase _addressSelectorUsecase;

  final nameCtrl = TextEditingController();
  final idVdoneCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final specificAddressCtrl = TextEditingController();

  void initData() async {
    final userInformationCached = await SharedPrefHelper.getUser();

    int countryId = userInformationCached?.address?.country?.id ?? 0;

    specificAddressCtrl.text = userInformationCached?.address?.address ?? '';

    if (userInformationCached?.address?.country?.id == null) {
      getCountries();
    } else {
      ProvinceModel? province = userInformationCached?.address?.province;

      DistrictModel? district = userInformationCached?.address?.district;

      WardModel? ward = userInformationCached?.address?.ward;

      emit(state.copyWith(
        countrySlected: CountryModel(
          id: countryId,
          name: userInformationCached?.address?.country?.name,
        ),
        provinceSelected: province,
        districtSelected: district,
        wardSelected: ward,
      ));
    }
  }

  Future<void> getCountries() async {
    emit(state.copyWith(onFetchCountries: FormzSubmissionStatus.inProgress));

    try {
      await _addressSelectorUsecase.fetchCountries().then(
        (response) {
          final countryVN = response.firstWhere(
            (element) => element.id == 240,
          );

          emit(
            state.copyWith(
              onFetchCountries: FormzSubmissionStatus.success,
              countries: response,
              countrySlected: countryVN,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        onFetchCountries: FormzSubmissionStatus.failure,
        countries: [],
      ));
    }
  }

  Future<void> getProvinces({int? countryId}) async {
    emit(state.copyWith(onFetchProvinces: FormzSubmissionStatus.inProgress));
    try {
      await _addressSelectorUsecase
          .fetchProvincesByCountry(countryId ?? state.countrySlected!.id!)
          .then(
        (response) {
          emit(
            state.copyWith(
              onFetchProvinces: FormzSubmissionStatus.success,
              provinces: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(onFetchProvinces: FormzSubmissionStatus.failure));
    }
  }

  Future<void> getDistricts({String? provinceId}) async {
    emit(
      state.copyWith(onFetchDistricts: FormzSubmissionStatus.inProgress),
    );
    try {
      await _addressSelectorUsecase
          .fetchDistrictsByProvince(provinceId ?? state.provinceSelected!.id!)
          .then(
        (response) {
          emit(
            state.copyWith(
              onFetchDistricts: FormzSubmissionStatus.success,
              districts: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(onFetchDistricts: FormzSubmissionStatus.failure));
    }
  }

  Future<void> getWards({String? districtId}) async {
    emit(
      state.copyWith(onFetchWards: FormzSubmissionStatus.inProgress),
    );
    try {
      await _addressSelectorUsecase
          .fetchWardsByDistrict(districtId ?? state.districtSelected!.id!)
          .then(
        (response) {
          emit(
            state.copyWith(
              onFetchWards: FormzSubmissionStatus.success,
              wards: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(onFetchWards: FormzSubmissionStatus.failure));
    }
  }

  void setCountry(CountryModel? value) {
    emit(state.copyWith(
      countrySlected: value,
      provinceSelected: ProvinceModel(id: '', name: null),
      provinces: [],
      districtSelected: DistrictModel(id: '', name: null),
      districts: [],
      wardSelected: WardModel(id: '', name: null),
      wards: [],
    ));
  }

  void setProvince(ProvinceModel? value) {
    emit(state.copyWith(
      provinceSelected: value,
      districtSelected: DistrictModel(id: '', name: null),
      districts: [],
      wardSelected: WardModel(id: '', name: null),
      wards: [],
    ));
  }

  void setDistrict(DistrictModel? value) {
    emit(state.copyWith(
      districtSelected: value,
      wardSelected: WardModel(id: '', name: null),
    ));
  }

  void setWard(WardModel? value) {
    emit(state.copyWith(wardSelected: value));
    specificAddressCtrl.clear();
  }
}
