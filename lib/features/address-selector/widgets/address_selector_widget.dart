import 'package:card_markethome/index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSelectorWidget extends StatelessWidget {
  const AddressSelectorWidget({
    super.key,
    required this.onSelectAddress,
  });

  final Function(
    CountryModel? country,
    ProvinceModel? province,
    DistrictModel? district,
    WardModel? ward,
    String? specificAddress,
  ) onSelectAddress;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddressSelectorCubit>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: BlocConsumer<AddressSelectorCubit, AddressSelectorState>(
                listenWhen: (previous, current) =>
                    previous.countrySlected != current.countrySlected,
                listener: (context, state) {
                  cubit.getProvinces();
                },
                buildWhen: (previous, current) =>
                    previous.onFetchCountries != current.onFetchCountries ||
                    previous.countrySlected != current.countrySlected,
                builder: (context, state) {
                  return AddressTitleDropdownWidget(
                    title: 'Quốc gia',
                    placeHolder: 'Chọn quốc gia',
                    content: state.countrySlected?.name,
                    items: state.countries ?? [],
                    onChanged: (value) {
                      cubit.setCountry(value);
                      onSelectAddress.call(
                        state.countrySlected,
                        state.provinceSelected,
                        state.districtSelected,
                        state.wardSelected,
                        '',
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: BlocConsumer<AddressSelectorCubit, AddressSelectorState>(
                listenWhen: (previous, current) =>
                    previous.countrySlected != current.countrySlected,
                listener: (context, state) {
                  cubit.getProvinces();
                },
                buildWhen: (previous, current) =>
                    previous.onFetchProvinces != current.onFetchProvinces ||
                    previous.provinceSelected != current.provinceSelected,
                builder: (context, state) {
                  return AddressTitleDropdownWidget(
                    title: 'Tỉnh / thành',
                    placeHolder: 'Chọn tỉnh / thành',
                    content: state.provinceSelected?.name,
                    items: state.provinces ?? [],
                    onChanged: (value) {
                      cubit.setProvince(value);
                      onSelectAddress.call(
                        state.countrySlected,
                        state.provinceSelected,
                        state.districtSelected,
                        state.wardSelected,
                        '',
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: BlocConsumer<AddressSelectorCubit, AddressSelectorState>(
                  listenWhen: (previous, current) =>
                      previous.provinceSelected != current.provinceSelected,
                  listener: (context, state) {
                    cubit.getDistricts();
                  },
                  buildWhen: (previous, current) =>
                      previous.onFetchDistricts != current.onFetchDistricts ||
                      previous.districtSelected != current.districtSelected,
                  builder: (context, state) {
                    return AddressTitleDropdownWidget(
                      title: 'Quận / huyện',
                      placeHolder: 'Chọn quận / huyện',
                      content: state.districtSelected?.name,
                      items: state.districts ?? [],
                      onChanged: (value) {
                        cubit.setDistrict(value);
                        onSelectAddress.call(
                          state.countrySlected,
                          state.provinceSelected,
                          state.districtSelected,
                          state.wardSelected,
                          '',
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: BlocConsumer<AddressSelectorCubit, AddressSelectorState>(
                  listenWhen: (previous, current) =>
                      previous.districtSelected != current.districtSelected,
                  listener: (context, state) {
                    cubit.getWards();
                  },
                  buildWhen: (previous, current) =>
                      previous.onFetchWards != current.onFetchWards ||
                      previous.wardSelected != current.wardSelected,
                  builder: (context, state) {
                    return AddressTitleDropdownWidget(
                      title: 'Phường / xã',
                      placeHolder: 'Chọn phường / xã',
                      content: state.wardSelected?.name,
                      items: state.wards ?? [],
                      onChanged: (value) {
                        cubit.setWard(value);
                        onSelectAddress.call(
                          state.countrySlected,
                          state.provinceSelected,
                          state.districtSelected,
                          state.wardSelected,
                          '',
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
        BlocBuilder<AddressSelectorCubit, AddressSelectorState>(
          buildWhen: (previous, current) =>
              previous.wardSelected != current.wardSelected,
          builder: (context, state) {
            return TitleTextfieldWidget(
              title: 'Địa chỉ cụ thể',
              placeHolder: 'Nhập địa chỉ cụ thể',
              validator: (value) => ValidationHelper.specialCharactersAndEmpty(
                value,
                'Địa chỉ cụ thể',
              ),
              controller: cubit.specificAddressCtrl,
              onChanged: (specificAddress) {
                onSelectAddress(
                  state.countrySlected,
                  state.provinceSelected,
                  state.districtSelected,
                  state.wardSelected,
                  cubit.specificAddressCtrl.text,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
