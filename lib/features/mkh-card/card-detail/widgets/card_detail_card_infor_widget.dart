import 'package:card_markethome/index.dart';

class CardDetailCardWidget extends StatelessWidget {
  const CardDetailCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 218,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 189,
              width: context.maxWidth,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Assets.lib_assets_images_img_card_class_shadow.svg(
              width: context.maxWidth,
              color: AppColors.black.withOpacity(0.25),
            ),
          ),
        ],
      ),
    );
  }
}
