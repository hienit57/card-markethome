import 'package:card_markethome/index.dart';

class CardOverviewPage extends StatelessWidget {
  const CardOverviewPage({
    super.key,
    this.isWidget = true,
  });

  final bool isWidget;

  static const String routeName = '/card-overview';

  @override
  Widget build(BuildContext context) {
    return isWidget
        ? _body(context)
        : Scaffold(
            backgroundColor: AppColors.colorF0F9FF,
            body: _body(context),
            floatingActionButton: Padding(
              padding: EdgeInsets.only(bottom: context.maxHeight * 0.03),
              child: const AppImage(
                assetImage: Assets.lib_assets_icons_ic_card_contact_upgrade,
              ),
            ),
          );
  }

  Widget _body(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CardClassCubit(
            cardUsecase: context.read<CardUsecase>(),
          ),
        ),
        BlocProvider(
          create: (context) => CardInforCubit(
            cardUsecase: context.read<CardUsecase>(),
          ),
        ),
      ],
      child: Container(
        color: AppColors.colorF0F9FF,
        child: const Column(
          children: [
            CardInforWidget(),
            Padding(
              padding: EdgeInsets.only(top: 24, bottom: 4),
              child: AppImage(
                assetImage: Assets.lib_assets_images_img_home_nav_card_class,
              ),
            ),
            CardClassWidget()
          ],
        ),
      ),
    );
  }
}
