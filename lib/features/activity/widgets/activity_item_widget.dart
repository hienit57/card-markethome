import 'package:card_markethome/index.dart';

class ItemActivityWidget extends StatelessWidget {
  const ItemActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Navigation.shared.push(
            path: NavigationRouter.transactionDetail.path,
          ),
          child: Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Assets.lib_assets_icons_ic_activity_money.svg(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yêu cầu mua gói MarketHome',
                              style: context.text.titleLarge?.copyWith(
                                color: AppColors.textPrimary,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '5.000.000đ',
                              style: context.text.titleLarge?.copyWith(
                                color: AppColors.textSecondary,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.colorFDF2DC,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 8),
                                child: Text(
                                  'Chờ xử lý',
                                  style: context.text.titleLarge?.copyWith(
                                    color: AppColors.colorF08315,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '12:12 - 30/10/2024',
                              style: context.text.titleSmall?.copyWith(
                                color: AppColors.color5E5E5E,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(height: 1, color: AppColors.colorE8E8E8),
      ],
    );
  }
}
