import 'package:card_markethome/index.dart';

class ProfileOverviewPage extends StatelessWidget {
  const ProfileOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: context.maxWidth,
            height: context.maxHeight,
            child: const AppImage(
              assetImage: Assets.lib_assets_images_img_bg_card_detail,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.kPaddingToolBar + 10,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Tôi',
                    style: context.text.titleMedium?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ProfileInforMeWidget(),
                const SizedBox(height: 17),
                ProfileOtherFeaturesWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
