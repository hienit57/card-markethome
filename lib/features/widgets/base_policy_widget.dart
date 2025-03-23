import 'package:card_markethome/index.dart';
import 'package:flutter/gestures.dart';

class BasePolicyWidget extends StatelessWidget {
  final String? title;
  final String? titleAccent;
  final Function(bool value)? onVerify;

  BasePolicyWidget({
    super.key,
    this.title = 'Tôi đã đọc và đồng ý với ',
    this.titleAccent = 'Điều khoản và dịch vụ',
    this.onVerify,
  });

  final ValueNotifier<bool> isAccept = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isAccept,
      builder: (context, valueAccept, child) => GestureDetector(
        onTap: () {
          isAccept.value = !valueAccept;
          onVerify?.call(valueAccept);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            valueAccept
                ? const AppImage(
                    assetImage: Assets.lib_assets_icons_ic_checkbox_base_check,
                    width: 20,
                    height: 20,
                  )
                : const AppImage(
                    assetImage:
                        Assets.lib_assets_icons_ic_checkbox_base_uncheck,
                    width: 20,
                    height: 20,
                  ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: title,
                  style: context.text.titleMedium?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                  children: [
                    TextSpan(
                      text: titleAccent,
                      style: context.text.titleMedium?.copyWith(
                        color: AppColors.textAccent,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
