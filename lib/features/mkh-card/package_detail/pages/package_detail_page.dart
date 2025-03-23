import 'package:card_markethome/index.dart';

class PackageDetailPage extends StatelessWidget {
  const PackageDetailPage({
    super.key,
    required this.agencyId,
    required this.packId,
    this.isFullScreen = true,
  });

  final int agencyId;
  final int packId;

  final bool isFullScreen;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackageDetailCubit(
        cardUsecase: context.read<CardUsecase>(),
        ricebookUsecase: context.read<RicebookUsecase>(),
      )..init(agencyId: agencyId, packId: packId),
      child: _PackageDetailBody(
        agencyId: agencyId,
        packId: packId,
        isFullScreen: isFullScreen,
      ),
    );
  }
}

class _PackageDetailBody extends StatefulWidget {
  final int agencyId;
  final int packId;

  final bool isFullScreen;

  const _PackageDetailBody({
    this.isFullScreen = true,
    required this.agencyId,
    required this.packId,
  });

  @override
  State<_PackageDetailBody> createState() => __PackageDetailBodyState();
}

class __PackageDetailBodyState extends State<_PackageDetailBody> {
  PackageDetailCubit get _cubit => context.read<PackageDetailCubit>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _cubit.state.canLoadMorepackages &&
          _cubit.state.onFetchRiceBookPackages !=
              FormzSubmissionStatus.inProgress) {
        _cubit.fetchRiceBookPackages();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFullScreen) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const BaseAppBar(title: 'Chi tiết gói'),
        body: ListView(children: [_body()]),
        bottomNavigationBar: const PackageDetailBottomWidget(),
      );
    } else {
      return _body();
    }
  }

  Widget _body() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: PackageInforWidget(),
        ),
        Container(height: 8, color: AppColors.colorF3F3F3),
        const PackageTextInforWidget(),
        Container(height: 8, color: AppColors.colorF3F3F3),
        BlocBuilder<PackageDetailCubit, PackageDetailState>(
          buildWhen: (previous, current) =>
              previous.packages != current.packages,
          builder: (context, state) {
            return MarketFleaHomeViewProducts(
              items: state.packages,
              scrollController: _scrollController,
            );
          },
        ),
      ],
    );
  }
}
