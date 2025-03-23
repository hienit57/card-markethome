import 'package:card_markethome/index.dart';

enum TabsEnum {
  home,
  active,
  notification,
  profile;

  int get indexTab {
    switch (this) {
      case TabsEnum.home:
        return 0;
      case TabsEnum.active:
        return 1;
      case TabsEnum.notification:
        return 2;
      case TabsEnum.profile:
        return 3;
    }
  }

  Widget get iconSelected {
    switch (this) {
      case TabsEnum.home:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_home_selected,
        );
      case TabsEnum.active:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_active_selected,
        );
      case TabsEnum.notification:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_notification_selected,
        );
      case TabsEnum.profile:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_profile_selected,
        );
    }
  }

  Widget get iconOutline {
    switch (this) {
      case TabsEnum.home:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_home_outline,
        );
      case TabsEnum.active:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_active_outline,
        );
      case TabsEnum.notification:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_notification_outline,
        );
      case TabsEnum.profile:
        return const AppImage(
          assetImage: Assets.lib_assets_icons_ic_tab_profile_outline,
        );
    }
  }

  String get title {
    switch (this) {
      case TabsEnum.home:
        return 'Trang chủ';
      case TabsEnum.active:
        return 'Hoạt động';
      case TabsEnum.notification:
        return 'Thông báo';
      case TabsEnum.profile:
        return 'Tôi';
    }
  }
}
