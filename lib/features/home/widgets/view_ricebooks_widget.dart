import 'package:card_markethome/index.dart';

class ViewRicebooksWidget extends StatefulWidget {
  const ViewRicebooksWidget({super.key});

  @override
  State<ViewRicebooksWidget> createState() => _ViewRicebooksWidgetState();
}

class _ViewRicebooksWidgetState extends State<ViewRicebooksWidget> {
  ScrollController _scrollController = ScrollController();

  HomeCubit get homeCubit => context.read<HomeCubit>();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          homeCubit.state.canLoadMorepackages &&
          homeCubit.state.onFetchRiceBookPackages !=
              FormzSubmissionStatus.inProgress) {
        homeCubit.fetchRiceBookPackages();
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
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.packages != current.packages,
      builder: (context, state) {
        if (state.packages.isNotEmpty) {
          return SizedBox(
            width: context.maxWidth,
            height: 217,
            child: ListView.separated(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 16),
              itemBuilder: (context, index) {
                final package = state.packages[index];

                return ItemRicebookWidget(
                  ricebook: package,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.packages.length,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
