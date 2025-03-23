import 'package:card_markethome/index.dart';

class ActivityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ActivityAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseAppBar(
      title: 'Chi tiết gói',
      isBack: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () => onFilter(context),
            child: Assets.lib_assets_icons_ic_filter_outline.svg(),
          ),
        ),
      ],
    );
  }

  void onFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BaseFilterBottomSheetWidget(
          onReset: () {},
          onApplyFilter: () {},
        );
      },
    );
  }

  static final AppBar _appBar = AppBar();

  @override
  Size get preferredSize => _appBar.preferredSize;
}
