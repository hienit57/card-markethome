import 'package:card_markethome/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF0F9FF,
      body: MultiBlocProvider(
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
          BlocProvider(
            create: (context) => RicebookCubit(
              ricebookUsecase: context.read<RicebookUsecase>(),
            )..init(),
          ),
        ],
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CardOverviewPage(),
            ),
            SliverToBoxAdapter(
              child: HomeConvertDOneWidget(),
            ),
            SliverToBoxAdapter(
              child: HomeRicebookWidget(),
            ),
            SliverToBoxAdapter(
              child: HomeReviewsWidget(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: context.maxHeight * 0.03),
        child: const AppImage(
          assetImage: Assets.lib_assets_icons_ic_card_contact_upgrade,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
