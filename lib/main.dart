import 'core/setting/middle_ware_setting.dart';
import 'index.dart';

FlavorSettings flavorSettings = FlavorSettings.staging();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPrefHelper.removeUser();

  Routes.configureRoutes(Navigation.shared.getRouter);
  runApp(MarketHomeApplication(
    settingConfig: MiddleWareSetting(
      flavor: 'staging',
      onCallBack: (callBackData) {
        print('callBackData: $callBackData');
      },
      isDev: true,
      accessToken:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwMTM0MCwidG9rZW5UeXBlIjowLCJpYXQiOjE3NDI1NjA0MDgsImV4cCI6MjAwMTc2MDQwOH0.wy65pTyYKucO4FxxGLucZ1w2hWagw_L9N1j3Wc6-0qI',
      refreshToken:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIwMDc0MiwidG9rZW5UeXBlIjowLCJpYXQiOjE3Mzk4NTM1MjUsImV4cCI6MTgwMjA2MTUyNX0.GNCLOcOVz6OxbZ4Q3HeBS_38SeD6yCCjz_2lB7Hlx_A',
    ),
  ));
}
