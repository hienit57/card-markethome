import 'package:card_markethome/index.dart';

class CardClassWidget extends StatelessWidget {
  const CardClassWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardClassCubit(
        cardUsecase: context.read<CardUsecase>(),
      )..fetchCardRanks(),
      child: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 309,
          width: context.maxWidth,
          child: const AppImage(
            assetImage: Assets.lib_assets_images_img_bg_card,
            fit: BoxFit.cover,
          ),
        ),
        const CardClassCarouselWidget(),
      ],
    );
  }
}
