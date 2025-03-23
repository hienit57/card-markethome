import 'package:card_markethome/index.dart';

class ProfileOtherFeaturesWidget extends StatelessWidget {
  const ProfileOtherFeaturesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _referraler(context);
  }

  Widget _referraler(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: ProfileOtherFeaturesEnum.values.map((value) {
            return Column(
              children: [
                _rowTitleContent(
                  context,
                  icon: value.icon,
                  title: value.title,
                  onTap: () {
                    switch (value) {
                      case ProfileOtherFeaturesEnum.purchaseInfor:
                        return Navigation.shared.push(
                          path: NavigationRouter.purchaseBatch.path,
                        );
                      case ProfileOtherFeaturesEnum.history:
                        return 'Lịch sử giao dịch';
                      case ProfileOtherFeaturesEnum.supportCenter:
                        return 'Trung tâm trợ giúp';
                      case ProfileOtherFeaturesEnum.feedback:
                        return 'Góp ý';
                      case ProfileOtherFeaturesEnum.notificationSetting:
                        return 'Cài đặt thông báo';
                    }
                  },
                ),
                if (value != ProfileOtherFeaturesEnum.notificationSetting) ...[
                  DeviderWidget(
                    isVertical: true,
                    sizePadding: 16,
                    color: AppColors.colorE8E8E8,
                    height: 1,
                    width: context.maxWidth,
                  ),
                ]
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _rowTitleContent(
    BuildContext context, {
    required Function() onTap,
    required Widget icon,
    required String title,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          const SizedBox(width: 8),
          Text(
            title,
            style: context.text.titleSmall?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const Spacer(),
          const AppImage(
            assetImage: Assets.lib_assets_icons_ic_arrow_right,
            width: 20,
            height: 20,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
