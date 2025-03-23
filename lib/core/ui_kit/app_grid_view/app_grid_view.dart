import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AppGridView<T> extends StatelessWidget {
  const AppGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
  });
  final List<T> items;
  final Widget Function(BuildContext, int) itemBuilder;
  final ScrollController? scrollController;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    if (scrollController == null) {
      return MasonryGridView.builder(
        scrollDirection: scrollDirection,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        itemCount: items.length,
        itemBuilder: itemBuilder,
      );
    }
    return MasonryGridView.builder(
      scrollDirection: scrollDirection,
      controller: scrollController,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemCount: items.length,
      itemBuilder: itemBuilder,
    );
  }
}
