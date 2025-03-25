import 'package:card_markethome/index.dart';

class AppBottomSheet extends StatefulWidget {
  final Widget child;
  final double? height;
  final bool isDismissible;
  final bool enableDrag;

  const AppBottomSheet({
    super.key,
    required this.child,
    this.height,
    this.isDismissible = true,
    this.enableDrag = true,
  });

  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    double? height,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      builder: (context) => AppBottomSheet(
        height: height,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        child: child,
      ),
    );
  }

  @override
  State<AppBottomSheet> createState() => _AppBottomSheetState();
}

class _AppBottomSheetState extends State<AppBottomSheet> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  final ValueNotifier<bool> isAtMaxPosition = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      isAtMaxPosition.value = _controller.size >= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: widget.height != null
          ? (widget.height! / context.maxHeight).clamp(0.6, 1)
          : 0.6,
      minChildSize: 0.6,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              ValueListenableBuilder<bool>(
                valueListenable: isAtMaxPosition,
                builder: (context, atMax, child) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: atMax ? _buildFullHeader() : _buildCompactHeader(),
                  );
                },
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: widget.child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFullHeader() {
    return Container(
      key: const ValueKey("fullHeader"),
      height: 102,
      width: double.infinity,
      color: AppColors.colorE4F4FF,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () => Navigation.pop(context),
              child: const SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: AppImage(
                    assetImage: Assets.lib_assets_icons_ic_arrow_back,
                  ),
                ),
              ),
            ),
            Text(
              'Chi tiết gói',
              style: context.text.titleLarge?.copyWith(
                fontSize: 18,
                color: AppColors.color1D325F,
              ),
            ),
            const SizedBox(width: 20), // Placeholder giữ cân bằng layout
          ],
        ),
      ),
    );
  }

  Widget _buildCompactHeader() {
    return Padding(
      key: const ValueKey("compactHeader"),
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 36),
              Text(
                'Chi tiết',
                style: context.text.titleLarge?.copyWith(
                  fontSize: 18,
                  color: AppColors.textSecondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () => Navigation.pop(context),
                  child: const AppImage(
                    assetImage: Assets.lib_assets_icons_ic_close,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const DeviderWidget(
            isVertical: false,
            sizePadding: 0,
            color: AppColors.grey12,
            height: 2,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
