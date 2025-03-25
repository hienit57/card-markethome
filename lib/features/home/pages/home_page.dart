import 'package:card_markethome/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorF0F9FF,
      body: BlocProvider(
        create: (context) => HomeCubit(
          ricebookUsecase: context.read<RicebookUsecase>(),
        )..init(),
        child: const CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CardInforWidget(),
            ),
            SliverToBoxAdapter(
              child: CardClassWidget(),
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
