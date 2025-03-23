import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

class CardInforLimitRewardWidget extends StatelessWidget {
  const CardInforLimitRewardWidget({super.key, required this.cardInfor});

  final WalletModel? cardInfor;

  @override
  Widget build(BuildContext context) {
    final totalLimit =
        cardInfor?.dOne.toInt().toAppCurrencyString(isWithSymbol: false);
    final totalReward =
        cardInfor?.givingDOne.toInt().toAppCurrencyString(isWithSymbol: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hạn mức: ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '$totalLimit ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textAccent,
                      fontSize: 12,
                    ),
                  ),
                  const AppImage(
                    assetImage: Assets.lib_assets_images_img_d_one,
                    width: 14,
                    height: 14,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Điểm thưởng: ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '$totalReward ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.textAccent,
                      fontSize: 12,
                    ),
                  ),
                  const AppImage(
                    assetImage: Assets.lib_assets_images_img_d_one,
                    width: 14,
                    height: 14,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
