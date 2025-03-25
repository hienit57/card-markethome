import 'package:card_markethome/index.dart';

class CardInforRegisteredWidget extends StatelessWidget {
  const CardInforRegisteredWidget({super.key, required this.userCardInfo});

  final UserCardModel? userCardInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 390,
      width: context.maxWidth,
      child: Stack(
        children: [
          SizedBox(
            height: 375,
            width: context.maxWidth,
            child: const AppImage(
              assetImage: Assets.lib_assets_images_img_bg_card,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 59,
            left: 10,
            right: 10,
            child: AppImage(
              assetImage: Assets.lib_assets_images_img_card_class_shadow,
              width: context.maxWidth,
              color: AppColors.black.withOpacity(0.25),
            ),
          ),
          Positioned(
            top: kToolbarHeight,
            left: 10,
            right: 10,
            child: SizedBox(
              width: context.maxWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20),
                  Text(
                    'Thẻ Markethome',
                    style: context.text.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => eventBus.fire('back'),
                    child: const AppImage(
                      assetImage: Assets.lib_assets_icons_ic_close,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 93,
            left: 20,
            right: 20,
            child: CardInformationWidget(
              cardInfor: userCardInfo?.wallet,
            ),
          ),
          // Positioned(
          //   bottom: 34,
          //   left: 0,
          //   right: 0,
          //   child: CardInforRenewNowWidget(
          //     cardInfor: userCardInfo?.wallet,
          //   ),
          // ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CardInforLimitRewardWidget(
              cardInfor: userCardInfo?.wallet,
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceExpired(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hạn mức: ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '20.000 D-One',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.colorFFCC00,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    'Điểm thưởng: ',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '20.000 D-One',
                    style: context.text.titleMedium?.copyWith(
                      color: AppColors.colorFFCC00,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(.3),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lịch sử',
                    style: context.text.titleMedium?.copyWith(
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const AppImage(
                    assetImage: Assets.lib_assets_icons_ic_arrow_right,
                    width: 16,
                    height: 16,
                    fit: BoxFit.fill,
                    color: AppColors.white,
                  )
                ],
              ),
            ),
          )
        ],
      );

  Widget _timeLine(BuildContext context) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 7),
            child: Stack(
              children: [
                Container(
                  height: 8,
                  color: AppColors.white,
                ),
                Container(
                  height: 8,
                  width: context.maxWidth * 0.7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.colorFFDFC8,
                        AppColors.colorFF9003,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.organge,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                ),
              ),
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: AppColors.organge,
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _dateTimeExpired(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '15/8/2024',
            style: context.text.titleMedium?.copyWith(
              fontSize: 12,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '15/8/2025',
            style: context.text.titleMedium?.copyWith(
              fontSize: 12,
              color: AppColors.white,
            ),
          )
        ],
      );
}
