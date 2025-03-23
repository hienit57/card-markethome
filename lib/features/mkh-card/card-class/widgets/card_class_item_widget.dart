import 'package:card_markethome/core/extentions/index.dart';
import 'package:card_markethome/index.dart';

class CardClassItemWidget extends StatelessWidget {
  final CardRankModel item;
  final bool isFocused;

  const CardClassItemWidget({
    super.key,
    required this.item,
    this.isFocused = false,
  });

  @override
  Widget build(BuildContext context) {
    final price = int.parse(item.requiredDOne ?? '0')
        .toAppCurrencyString(isWithSymbol: false);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: SizedBox(
            height: 226,
            child: Stack(
              children: [
                AppImage(
                  assetImage: Assets.lib_assets_images_img_bg_card_class,
                  width: context.maxWidth,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    const SizedBox(height: 17),
                    Text(
                      item.name ?? '',
                      style: context.text.titleLarge?.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    AppImage(
                      imageUrl: item.backgroundUrl ?? '',
                      height: 71,
                      width: 107,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          price,
                          style: context.text.titleLarge?.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const AppImage(
                          assetImage: Assets.lib_assets_images_img_d_one,
                          width: 14,
                          height: 14,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        item.description ?? '',
                        textAlign: TextAlign.center,
                        style: context.text.bodyLarge?.copyWith(
                          fontSize: 10,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigation.shared.push(
                        path: NavigationRouter.cardDetail.path,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: AppColors.white,
                          ),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.colorF4C015,
                              AppColors.colorFF951D,
                            ],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1018280F),
                              offset: Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x10182826),
                              offset: Offset(0, 4),
                              blurRadius: 8,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 3,
                            bottom: 5,
                            left: 9,
                            right: 8,
                          ),
                          child: Text(
                            'Nâng cấp',
                            textAlign: TextAlign.center,
                            style: context.text.titleLarge?.copyWith(
                              fontSize: 10,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: AppImage(
            imageUrl: item.crownImageUrl ?? '',
            height: 28,
            width: 28,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
