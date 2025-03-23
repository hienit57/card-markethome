import 'package:card_markethome/index.dart';

class CardDetailPage extends StatelessWidget {
  const CardDetailPage({super.key});

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
            child: Assets.lib_assets_images_img_bg_card_detail.svg(
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: context.kPaddingToolBar + 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardDetailAppBar(),
                SizedBox(height: 18),
                CardDetailCardWidget(),
                SizedBox(height: 8),
                CardDetailTextInforWidget(),
                Spacer(),
                CardDetailBottomWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
