import 'package:card_markethome/index.dart';

class ReferralCodeWidget extends StatelessWidget {
  const ReferralCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorBFBFBF.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.referralCode,
            style: context.text.titleMedium?.copyWith(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: GestureDetector(
                  onTap: () async {
                    final barCode = await Navigation.shared
                        .push(path: NavigationRouter.barCodeScanner.path);

                    // Kiểm tra ký tự đầu tiên có phải là số
                    if (barCode.isNotEmpty &&
                        RegExp(r'[0-9]').hasMatch(barCode[0])) {
                      context.showToastMessage(
                        'Mã QR không hợp lệ',
                        ToastMessageType.error,
                      );
                      return;
                    }

                    final barCodeData = jsonDecode(barCode);
                    final pDoneId = barCodeData['pDoneId'];

                    if (pDoneId != null) {
                      cubit.fetchMarshopByUserId(
                        pDoneId: pDoneId,
                      );
                      return;
                    }
                  },
                  child: const AppImage(
                    assetImage: Assets.lib_assets_images_img_barcode,
                    width: 40,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: BlocBuilder<CardRegisterCubit, CardRegisterState>(
                  buildWhen: (previous, current) =>
                      previous.marshopByUserIdResponse !=
                      current.marshopByUserIdResponse,
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: AppTextField(
                            controller: cubit.referralCtrl,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            placeholder: S.current.enterReferralCode,
                            borderRadius: 8,
                            onChanged: (value) {
                              cubit.debounceHelper.run(() {
                                cubit.fetchMarshopByUserId(
                                  pDoneId: value,
                                );
                              });
                            },
                            validator: (p0) {
                              if (state.marshopByUserIdResponse?.id == null) {
                                return 'Mã giới thiệu không hợp lệ';
                              }
                              return null;
                            },
                            suffix: cubit.referralCtrl.text.isNotEmpty
                                ? (state.marshopByUserIdResponse?.id == null
                                    ? const AppImage(
                                        assetImage: Assets
                                            .lib_assets_icons_ic_info_circle,
                                        width: 16,
                                        height: 16,
                                        fit: BoxFit.fill,
                                        color: AppColors.red500,
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          cubit.referralCtrl.clear();
                                          cubit.fetchMarshopByUserId(
                                            pDoneId: cubit.referralCtrl.text,
                                          );
                                        },
                                        child: const AppImage(
                                          assetImage: Assets
                                              .lib_assets_icons_ic_close_circle,
                                          width: 16,
                                          height: 16,
                                          fit: BoxFit.fill,
                                          color: AppColors.black,
                                        ),
                                      ))
                                : null,
                          ),
                        ),
                        if (state.marshopByUserIdResponse?.id == null &&
                            cubit.referralCtrl.text.isEmpty) ...[
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () async {
                              final pDoneId = await Navigation.shared.push(
                                path: NavigationRouter.marshopRefferal.path,
                              );

                              if (pDoneId is String) {
                                cubit.fetchMarshopByUserId(
                                  pDoneId: pDoneId,
                                );
                              }
                            },
                            child: Text(
                              S.current.marshop_referral_code,
                              style: context.text.titleSmall?.copyWith(
                                fontSize: 12,
                                color: AppColors.textAccent,
                              ),
                            ),
                          ),
                        ]
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
