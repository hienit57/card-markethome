import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

class CardPackageSelectorWidget extends StatelessWidget {
  const CardPackageSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();

    return BlocBuilder<CardRegisterCubit, CardRegisterState>(
      buildWhen: (previous, current) =>
          previous.onFetchCardPackages != current.onFetchCardPackages,
      builder: (context, state) {
        if (state.cardPackagesResponse?.packs?.isNotEmpty ?? false) {
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
                children: [
                  RowTitleContentWidget(
                    title: 'Mua thẻ MarketHome',
                    titleStyle: context.text.titleLarge?.copyWith(
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                    content: 'Xem chi tiết',
                    contentStyle: context.text.titleMedium?.copyWith(
                      color: AppColors.textAccent,
                    ),
                    onTap: () => onViewDetailCardPackage(
                      context,
                      agencyId: cubit.state.agencyId,
                      packId: cubit.state.packId,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _cardPackageInfo(context,
                      cardInfo: cubit.state.cardInfo!.pack!),
                  DeviderWidget(
                    isVertical: true,
                    sizePadding: 12,
                    color: AppColors.colorF1F1F1,
                    height: 1,
                    width: context.maxWidth,
                  ),
                  _numberStepper(context),
                ],
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _cardPackageInfo(
    BuildContext context, {
    required CardModel cardInfo,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 68,
          width: 53,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: AppImage(
              imageUrl: cardInfo.getImageCardMKH,
              usePlaceHolder: true,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardInfo.getNameCardMKH,
              style: context.text.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 18,
              ),
            ),
            Text(
              cardInfo.getPriceCardMKH.toAppCurrencyString(),
              style: context.text.titleMedium?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _numberStepper(BuildContext context) {
    final cubit = context.read<CardRegisterCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Số lượng',
          style: context.text.titleSmall?.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        NumberStepperWidget(
          initialValue: cubit.state.userRegisterPayload?.totalPack ?? 0,
          maxValue: cubit.state.limitTotalPack,
          sizeButton: 24,
          radiusButton: 8,
          onChange: (value) {
            cubit.setTotalPack(value);
          },
        ),
      ],
    );
  }

  void onViewDetailCardPackage(
    BuildContext context, {
    required int agencyId,
    required int packId,
  }) {
    AppBottomSheet.show(
      context,
      child: PackageDetailPage(
        isFullScreen: false,
        agencyId: agencyId,
        packId: packId,
      ),
    );
  }
}
