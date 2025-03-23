import 'package:card_markethome/index.dart';

class ItemNotificationWidget extends StatelessWidget {
  const ItemNotificationWidget({super.key});

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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const AppImage(
                      assetImage:
                          Assets.lib_assets_icons_ic_tab_profile_outline,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Tài khoản của bạn đã được nâng cấp lên hàng Vàng',
                      style: context.text.titleMedium?.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    '2p trước',
                    style: context.text.titleSmall?.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
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
