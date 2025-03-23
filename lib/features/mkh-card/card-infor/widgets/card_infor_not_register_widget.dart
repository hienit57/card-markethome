import 'package:card_markethome/index.dart';
import 'package:flutter/material.dart';

class CardInforNotRegisterWidget extends StatelessWidget {
  const CardInforNotRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const SizedBox(
              width: double.infinity,
              child: AppImage(
                assetImage: Assets.lib_assets_images_img_home_register_card_now,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {},
                  child: SizedBox(
                    width: context.maxWidth / 2,
                    height: 40,
                  ),
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            top: context.kPaddingToolBar + 10,
            left: 12,
            right: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              Text(
                'Thẻ Markethome',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => eventBus.fire('back'),
                child: const AppImage(
                  assetImage: Assets.lib_assets_icons_ic_close,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
