import 'package:card_markethome/index.dart';

enum ProfileOtherFeaturesEnum {
  purchaseInfor,
  history,
  supportCenter,
  feedback,
  notificationSetting;

  Widget get icon {
    switch (this) {
      case ProfileOtherFeaturesEnum.purchaseInfor:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_active_outline,
          width: 24,
          height: 24,
        );
      case ProfileOtherFeaturesEnum.history:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_clock,
          width: 24,
          height: 24,
        );
      case ProfileOtherFeaturesEnum.supportCenter:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_messages,
          width: 24,
          height: 24,
        );
      case ProfileOtherFeaturesEnum.feedback:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_sms,
          width: 24,
          height: 24,
        );
      case ProfileOtherFeaturesEnum.notificationSetting:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_vuewsax_linear_notification,
          width: 24,
          height: 24,
        );
    }
  }

  String get title {
    switch (this) {
      case ProfileOtherFeaturesEnum.purchaseInfor:
        return 'Thông tin đợt mua';
      case ProfileOtherFeaturesEnum.history:
        return 'Lịch sử giao dịch';
      case ProfileOtherFeaturesEnum.supportCenter:
        return 'Trung tâm trợ giúp';
      case ProfileOtherFeaturesEnum.feedback:
        return 'Góp ý';
      case ProfileOtherFeaturesEnum.notificationSetting:
        return 'Cài đặt thông báo';
    }
  }
}
