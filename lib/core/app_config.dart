import 'setting/middle_ware_setting.dart';

class AppConfigSingleton {
  AppConfigSingleton._();

  static MiddleWareSetting? appSetting;

  static bool get isDev => appSetting?.isDev ?? false;
  static String get accessToken => appSetting?.accessToken ?? '';
  static String get refreshToken => appSetting?.refreshToken ?? '';
}
