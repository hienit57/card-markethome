import 'package:card_markethome/index.dart';

class HomeReviewsWidget extends StatelessWidget {
  const HomeReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 4),
          child: AppImage(
            assetImage: Assets.lib_assets_images_img_home_nav_review,
          ),
        ),
        Container(
          color: AppColors.colorCCEAFF,
          width: context.maxWidth,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 18,
              top: 36,
            ),
            child: _viewListReview(context),
          ),
        )
      ],
    );
  }

  Widget _viewListReview(BuildContext context) {
    return SizedBox(
      width: context.maxWidth,
      height: 316,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (context, index) {
          return _itemMemberReview(context);
        },
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: 7,
      ),
    );
  }

  Widget _itemMemberReview(BuildContext context) {
    return Container(
      width: 211,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                // Container(
                //   width: 36,
                //   height: 36,
                //   decoration: const BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: AppColors.accent4,
                //   ),
                // ),
                const AppImage(
                  assetImage: Assets.lib_assets_icons_ic_tab_profile_outline,
                  width: 36,
                  height: 36,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Blog MarketHome',
                      style: context.text.titleMedium?.copyWith(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      '7h trước',
                      style: context.text.titleSmall?.copyWith(
                        fontSize: 12,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Tham gia thẻ thành viên MarketHome, tôi đã nhận được rất nhiều ưu đãi hấp dẫn',
              style: context.text.titleSmall?.copyWith(
                fontSize: 12,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            const AppImage(
              assetImage: Assets.lib_assets_images_img_member_review,
            ),
            const SizedBox(height: 4),
            Container(
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
                  'Mua ngay',
                  textAlign: TextAlign.center,
                  style: context.text.titleLarge?.copyWith(
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
