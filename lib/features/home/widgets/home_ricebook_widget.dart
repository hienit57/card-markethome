import 'package:card_markethome/features/ricebook/index.dart';
import 'package:card_markethome/index.dart';

class HomeRicebookWidget extends StatelessWidget {
  const HomeRicebookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 4),
          child: Assets.lib_assets_images_img_home_nav_ricebook.svg(),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.colorC9E9FE,
                AppColors.white,
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 39),
                child: AppImage(
                  assetImage: Assets.lib_assets_images_img_home_ricebook,
                  width: context.maxWidth,
                  height: 374,
                ),
              ),
              const SizedBox(height: 16),
              _buttonTitle(context: context, title: 'Được mua nhiều nhất'),
              const SizedBox(height: 16),
              const ViewListItemRicebookWidget(),
              const SizedBox(height: 27),
              _buttonTitle(context: context, title: 'Hỗ trợ vận chuyển'),
              const SizedBox(height: 16),
              const ViewListItemRicebookWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonTitle({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1018280F),
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x10182826),
            offset: Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.color03B6F4,
            AppColors.color006DE4,
          ],
        ),
        border: Border.all(
          width: 2,
          color: AppColors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Text(
          title,
          style: context.text.titleLarge?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
