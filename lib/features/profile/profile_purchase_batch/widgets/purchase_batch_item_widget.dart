import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';

class ItemPurchaseBatchWidget extends StatelessWidget {
  const ItemPurchaseBatchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0x1018280F).withOpacity(0.06),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: const Color(0x1018281A).withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Row(
          children: [
            const AppImage(
              assetImage: Assets.lib_assets_icons_ic_marshop,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: VerticalDotLine(),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngày 15 Thg 3 2024',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        'Số lượng đã mua: 5',
                        style: context.text.titleMedium?.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  CustomSolidButton(
                    height: 28,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    title: 'Gia hạn',
                    titleStyle: context.text.titleLarge?.copyWith(
                      fontSize: 12,
                      color: AppColors.white,
                    ),
                    onTap: () => Navigation.shared.push(
                      path:
                          NavigationRouter.purchaseBatchTransactionDetail.path,
                    ),
                    backgroundColor: AppColors.textAccent,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
