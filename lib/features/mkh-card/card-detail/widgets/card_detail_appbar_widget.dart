import 'package:card_markethome/index.dart';

class CardDetailAppBar extends StatelessWidget {
  const CardDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Assets.lib_assets_icons_ic_arrow_back.svg(
              width: 20,
              height: 20,
              color: AppColors.white,
            ),
          ),
          Text(
            'Thông tin thẻ',
            style: context.text.titleMedium?.copyWith(
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
