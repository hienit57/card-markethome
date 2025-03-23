import 'package:card_markethome/index.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    //checkAndRequestPermissionPhoto();
  }

  Future<void> checkAndRequestPermissionPhoto() async {
    final status = await Permission.photos.status;

    print(status.toString());

    if (status.isDenied || status.isRestricted) {
      final requestStatus = await Permission.camera.request();
      if (!requestStatus.isGranted) {
        showToastMessage(
          'Thao tác không thành công do không được phép truy cập Camera',
          ToastMessageType.error,
        );
      }
    }

    if (status.isRestricted) {
      final statusRequest = await Permission.photos.request();
      if (statusRequest == PermissionStatus.denied) {
        showToastMessage(
          'Quyền bị từ chối!',
          ToastMessageType.error,
        );
      }
    }

    if (status.isDenied) {
      showToastMessage(
        'Quyền bị từ chối!',
        ToastMessageType.success,
      );
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SplashCubit>(
        create: (context) => SplashCubit(
          useProfileUsecase: context.read<UserProfileUsecase>(),
          addressUsecase: context.read<AddressSelectorUsecase>(),
        )..initData(),
        child: BlocBuilder<SplashCubit, SplashState>(
          buildWhen: (previous, current) =>
              previous.onFetchUserProfile != current.onFetchUserProfile,
          builder: (context, state) {
            return Stack(
              children: [
                SizedBox(
                  width: context.maxWidth,
                  child: AppImage(
                    assetImage: Assets.lib_assets_images_img_splash_card_mkh,
                    height: context.maxHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.kPaddingToolBar + 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                eventBus.fire('back');
                              },
                              child: const AppImage(
                                assetImage: Assets.lib_assets_icons_ic_close,
                              ),
                            ),
                            CustomSolidButton(
                              height: 32,
                              radius: 100,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              backgroundColor: AppColors.white.withOpacity(0.1),
                              title: 'Bỏ qua',
                              titleStyle: context.text.titleMedium?.copyWith(
                                color: AppColors.white,
                              ),
                              onTap: () => Navigation.shared.push(
                                path: NavigationRouter.mainTab.path,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Trở thành \nthành viên thẻ \nMarketHome',
                          style: context.text.titleLarge?.copyWith(
                            fontSize: 40,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 26),
                        child: CustomSolidButton(
                          radius: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          backgroundColor: AppColors.white,
                          title: 'Đăng ký ngay',
                          titleStyle: context.text.titleMedium?.copyWith(
                            color: AppColors.textAccent,
                            fontSize: 16,
                          ),
                          onTap: () => Navigation.shared.push(
                            path: NavigationRouter.cardRegister.path,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
