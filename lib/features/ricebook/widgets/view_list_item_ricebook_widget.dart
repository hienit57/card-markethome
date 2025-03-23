import 'package:card_markethome/index.dart';

class ViewListItemRicebookWidget extends StatefulWidget {
  const ViewListItemRicebookWidget({super.key});

  @override
  State<ViewListItemRicebookWidget> createState() =>
      _ViewListItemRicebookWidgetState();
}

class _ViewListItemRicebookWidgetState
    extends State<ViewListItemRicebookWidget> {
  ScrollController _scrollController = ScrollController();

  RicebookCubit get ricebookCubit => context.read<RicebookCubit>();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          ricebookCubit.state.canLoadMorepackages &&
          ricebookCubit.state.onFetchRiceBookPackages !=
              FormzSubmissionStatus.inProgress) {
        ricebookCubit.fetchRiceBookPackages();
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
    return BlocBuilder<RicebookCubit, RicebookState>(
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
