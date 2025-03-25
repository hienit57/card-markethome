import 'package:card_markethome/features/address-selector/widgets/address_selector_widget.dart';
import 'package:card_markethome/index.dart';

class CardOwnerInforWidget extends StatelessWidget {
  const CardOwnerInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40BFBFBF),
            offset: Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _contactInfo(context),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Địa chỉ nhận thông tin',
                style: context.text.titleLarge?.copyWith(
                  fontSize: 16,
                  color: AppColors.neutral900,
                ),
              ),
            ),
            _addressSelector(context),
          ],
        ),
      ),
    );
  }

  Widget _contactInfo(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Thông tin chủ thẻ',
          style: context.text.titleLarge?.copyWith(
            fontSize: 16,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        TitleTextfieldWidget(
          title: 'Tên chủ thẻ',
          placeHolder: 'Nhập tên chủ thẻ',
          controller: cubit.nameCtrl,
          focusNode: cubit.nameFocusNode,
          onChanged: (value) {
            cubit.debounceHelper.run(() {
              cubit.updatePayload();
            });
          },
          validator: (value) =>
              ValidationHelper.requiredValidAndNotNum(value, 'Họ và tên'),
        ),
        const SizedBox(height: 16),
        TitleTextfieldWidget(
          readOnly: true,
          title: 'ID VDONE',
          placeHolder: 'Nhập ID VDONE',
          controller: cubit.idVdoneCtrl,
        ),
        const SizedBox(height: 16),
        TitleTextfieldWidget(
          readOnly: true,
          title: 'Số điện thoại',
          placeHolder: 'Nhập số điện thoại',
          controller: cubit.phoneCtrl,
        ),
        const SizedBox(height: 16),
        TitleTextfieldWidget(
          title: 'Email',
          placeHolder: 'Vui lòng nhập Email của bạn',
          controller: cubit.emailCtrl,
          onChanged: (value) {
            cubit.debounceHelper.run(() {
              cubit.updatePayload();
            });
          },
          validator: (value) => ValidationHelper.email(value),
        ),
      ],
    );
  }

  Widget _addressSelector(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();

    return AddressSelectorWidget(
      onSelectAddress: (country, province, district, ward, specificAddress) {
        cubit.setNewAddress(
          country,
          province,
          district,
          ward,
          specificAddress,
        );
      },
    );
  }
}
