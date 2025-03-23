import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

class ItemRicebookWidget extends StatelessWidget {
  const ItemRicebookWidget({super.key, this.ricebook});

  final RicebookPackageModel? ricebook;

  @override
  Widget build(BuildContext context) {
    final imagePackage =
        ricebook?.supplierVariants?.first.variant?.thumbnail?.first ?? '';

    final namePackage = ricebook?.supplierVariants?.first.variant?.name ?? '';

    final pricePackage = ricebook?.supplierVariants?.first.totalDOneProductPrice
            .toAppCurrencyString(isWithSymbol: false) ??
        '';

    final startRating = ricebook?.customerRating ?? 0;

    final totalSold = ricebook?.supplierVariants?.first.certSoldCount ?? 0;

    return Container(
      width: 137,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0x101B281A),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 1.0, // Tỷ lệ 1:1
              child: AppImage(
                imageUrl: imagePackage,
                usePlaceHolder: true,
                height: 136,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  namePackage,
                  style: context.text.titleSmall?.copyWith(
                    fontSize: 12,
                  ),
                  maxLines: 2,
                ),
                Row(
                  children: [
                    Text(
                      'D-One: $pricePackage',
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 12,
                        color: AppColors.colorD66400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const AppImage(
                      assetImage: Assets.lib_assets_images_img_d_one,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const AppImage(
                      assetImage: Assets.lib_assets_icons_ic_star,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '$startRating',
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 10,
                        color: AppColors.color6E6E6E,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 12.5,
                        width: 1,
                        color: AppColors.colorE9E9E9,
                      ),
                    ),
                    Text(
                      'Đã bán $totalSold',
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 10,
                        color: AppColors.color6E6E6E,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
