import 'package:card_markethome/index.dart';

class HomeConvertDOneWidget extends StatelessWidget {
  const HomeConvertDOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 4),
          child: Assets.lib_assets_images_img_home_nav_convert.svg(),
        ),
        Assets.lib_assets_images_img_home_convert_d_one.svg(
          width: context.maxWidth,
        ),
      ],
    );
  }
}
