import 'package:card_markethome/index.dart';

class HomeConvertDOneWidget extends StatelessWidget {
  const HomeConvertDOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 24, bottom: 4),
          child: AppImage(
            assetImage: Assets.lib_assets_images_img_home_nav_convert,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        AppImage(
          assetImage: Assets.lib_assets_images_img_home_convert_d_one,
          width: context.maxWidth,
        ),
      ],
    );
  }
}
