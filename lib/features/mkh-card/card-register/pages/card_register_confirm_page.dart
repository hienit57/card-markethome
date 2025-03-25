import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';
import 'package:flutter/foundation.dart';

class CardRegisterConfirmPage extends StatelessWidget {
  const CardRegisterConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isVerifyPolicy = ValueNotifier<bool>(true);

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<CardRegisterCubit, CardRegisterState>(
              buildWhen: (previous, current) =>
                  previous.cardPackagesResponse != current.cardPackagesResponse,
              builder: (context, state) {
                final cardInfo = state.userRegisterPayload;

                return ListView(
                  children: [
                    const SizedBox(height: 16),
                    _buildSaveContract(context),
                    const SizedBox(height: 20),
                    _buildInfoCardOwner(context, cardInfo),
                    const SizedBox(height: 16),
                    _buildTransactionInfo(context, cardInfo),
                    const SizedBox(height: 16),
                    _buildReferralInfo(context, cardInfo),
                    const SizedBox(height: 16),
                    _buildCardRank(context, cardInfo),
                    const SizedBox(height: 16),
                    BasePolicyWidget(
                      onVerify: (value) {
                        isVerifyPolicy.value = value;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ),
        _buildButtonBottom(context, isVerifyPolicy),
      ],
    );
  }

  Widget _buildSaveContract(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorF0F9FF,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.colorBBDEF4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            const AppImage(
              assetImage: Assets.lib_assets_icons_ic_contract_vdone,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Hợp đồng của bạn sẽ được VDONE lưu trữ.',
              style: context.text.titleSmall?.copyWith(
                fontSize: 12,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardOwner(
    BuildContext context,
    CardRegisterPayload? cardInfo,
  ) {
    final country = cardInfo?.countryNew?.name ?? '';
    final city = cardInfo?.provinceNew?.name ?? '';
    final district = cardInfo?.districtNew?.name ?? '';
    final ward = cardInfo?.wardNew?.name ?? '';
    final specificAddress = cardInfo?.specificAddressNew ?? '';

    final fullAddress = '$specificAddress, $ward $district, $city, $country';

    return SectionInforWidget(
      title: 'Thông tin chủ thẻ',
      children: [
        RowTitleContentWidget(
          title: 'Tên chủ thẻ',
          content: cardInfo?.nameOwnerNew ?? '',
        ),
        RowTitleContentWidget(
          title: 'ID VDONE',
          content: cardInfo?.pDoneId ?? '',
        ),
        RowTitleContentWidget(
          title: 'Số điện thoại',
          content: cardInfo?.phone ?? '',
        ),
        RowTitleContentWidget(
          title: 'Email',
          content: cardInfo?.emailNew ?? '',
        ),
        RowTitleContentWidget(
          title: 'Địa chỉ',
          content: fullAddress,
        ),
      ],
    );
  }

  Widget _buildTransactionInfo(
    BuildContext context,
    CardRegisterPayload? cardInfo,
  ) {
    final name = cardInfo?.cardMKH?.name ?? '';

    final quantity = cardInfo?.totalPack.toString() ?? '';

    final priceLimit =
        cardInfo?.cardMKH?.originalPrice.toAppCurrencyString() ?? '';
    final priceLimitToDOne =
        cardInfo?.cardMKH?.dOne.toAppCurrencyString(isWithSymbol: false) ?? '';

    final totalPriceLimitPurchase =
        ((cardInfo?.cardMKH?.originalPrice ?? 0) * (cardInfo?.totalPack ?? 0))
            .toAppCurrencyString();

    final totalDOneLimitPurchase =
        ((cardInfo?.cardMKH?.dOne ?? 0) * (cardInfo?.totalPack ?? 0))
            .toAppCurrencyString(isWithSymbol: false);

    return SectionInforWidget(
      title: 'CHI TIẾT GIAO DỊCH',
      children: [
        RowTitleContentWidget(
          title: 'Loại giao dịch',
          content: name,
        ),
        RowTitleContentWidget(
          title: 'Hạn mức',
          content: priceLimit,
        ),
        RowTitleContentWidget(
          title: 'Số lượng D-One',
          content: '$priceLimitToDOne D-One',
        ),
        RowTitleContentWidget(
          title: 'Số lượng',
          content: quantity,
        ),
        RowTitleContentWidget(
          title: 'Tổng hạn mức thanh toán',
          content: totalPriceLimitPurchase,
        ),
        RowTitleContentWidget(
          title: 'Hạn mức quy đổi nhận được',
          content: '$totalDOneLimitPurchase D-One',
        ),
      ],
    );
  }

  Widget _buildReferralInfo(
    BuildContext context,
    CardRegisterPayload? cardInfo,
  ) {
    final userName = cardInfo?.marshopRefferal?.user?.fullName ?? '';
    final pDoneId = cardInfo?.marshopRefferal?.user?.pDoneId ?? '';

    return SectionInforWidget(
      title: 'Người giới thiệu',
      children: [
        RowTitleContentWidget(
          title: 'Tên chủ thẻ',
          content: userName,
        ),
        RowTitleContentWidget(
          title: 'ID VDONE',
          content: pDoneId,
        ),
        // BlocBuilder<CardRegisterCubit, CardRegisterState>(
        //   buildWhen: (previous, current) =>
        //       previous.onCreateRequestBuyCard != current.onCreateRequestBuyCard,
        //   builder: (context, state) {
        //     final referralCommission =
        //         int.parse(state.billBuyCardResponse?.refererCommission ?? '0');
        //     final priceReferral =
        //         ((cardInfo?.cardMKH?.originalPrice ?? 0) * referralCommission)
        //             .toAppCurrencyString();
        //     return RowTitleContentWidget(
        //       title: 'Số tiền nhận được',
        //       content: priceReferral,
        //     );
        //   },
        // ),
      ],
    );
  }

  Widget _buildCardRank(BuildContext context, CardRegisterPayload? cardInfo) {
    return BlocBuilder<CardRegisterCubit, CardRegisterState>(
      buildWhen: (previous, current) =>
          previous.nextCardRankResponse != current.nextCardRankResponse,
      builder: (context, state) {
        if (state.nextCardRankResponse?.backgroundUrl != null) {
          final backgroundUrl = state.nextCardRankResponse?.backgroundUrl ?? '';
          final rankName = state.nextCardRankResponse?.name ?? '';

          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  AppImage(
                    imageUrl: backgroundUrl,
                    width: 76,
                    height: 66,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                'Sau khi thanh toán thành công, hạng thẻ của bạn là: ',
                            style: context.text.titleMedium?.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          TextSpan(
                            text: rankName,
                            style: context.text.titleMedium?.copyWith(
                              color: AppColors.textPrimary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildButtonBottom(
    BuildContext context,
    ValueListenable<bool> isVerifyPolicy,
  ) {
    final cubit = context.read<CardRegisterCubit>();

    return Container(
      color: AppColors.white,
      width: context.maxWidth,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<CardRegisterCubit, CardRegisterState>(
              buildWhen: (previous, current) =>
                  previous.totalPriceBuyCard != current.totalPriceBuyCard,
              listenWhen: (previous, current) =>
                  previous.onCreateRequestBuyCard !=
                      current.onCreateRequestBuyCard ||
                  previous.onCancelTransaction != current.onCancelTransaction,
              listener: (context, state) async {
                if (state.onCancelTransaction.isSuccess) {
                  Navigation.popUntil(
                    context,
                    NavigationRouter.splash.path,
                  );
                  return;
                }

                if (state.onCancelTransaction.isFailure) {
                  ConfirmationDialog.showOnlyConfirm(
                    context: context,
                    title: 'Thông báo',
                    message: 'Huỷ giao dịch thất bại',
                  );
                  return;
                }

                if (state.onCreateRequestBuyCard ==
                    FormzSubmissionStatus.success) {
                  final result = await Navigation.shared.push(
                    path: NavigationRouter.cardRegisterWaitting.path,
                    params: {
                      'title':
                          'Yêu cầu nạp hạn mức thẻ của bạn đã được gửi đến Đại lý MarketHome đang chờ phê duyệt. Vui lòng chờ trong giây lát.',
                      'isShowCountdown': true,
                      'typeListenSocket': TypeListenSocketEnum
                          .userPersonalDOneTransactionAcknowledged,
                    },
                  );

                  if (result == EventTransactionEnum.agentConfirm) {
                    cubit.setCurrentStep(RegisterStepEnum.step3);
                  }

                  if (result == EventTransactionEnum.cancelTransaction) {
                    cubit.cancelTransaction();
                  }
                }
                if (state.onCreateRequestBuyCard ==
                    FormzSubmissionStatus.failure) {
                  ConfirmationDialog.showOnlyConfirm(
                    context: context,
                    title: 'Thông báo',
                    message:
                        'Bạn đang có 1 giao dịch trước đó, vui lòng chờ xử lý!',
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hạn mức',
                          style: context.text.titleMedium?.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          state.totalPriceBuyCard,
                          style: context.text.titleLarge?.copyWith(
                            color: AppColors.textAccent,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ValueListenableBuilder(
                      valueListenable: isVerifyPolicy,
                      builder: (context, value, child) => CustomSolidButton(
                        title: 'Xác nhận',
                        disabled: value,
                        backgroundColor: AppColors.textAccent,
                        onTap: () {
                          cubit.createRequestBuyCard();
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
