import 'package:card_markethome/index.dart';

class MarketFleaHomeViewProducts<T> extends StatelessWidget {
  const MarketFleaHomeViewProducts({
    super.key,
    required this.items,
    required this.scrollController,
  });

  final List<T> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CÁC SẢN PHẨM SỔ GẠO',
            style: context.text.titleMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          AppGridView(
            items: items,
            scrollController: scrollController,
            itemBuilder: (context, index) {
              final item = items[index];

              return ItemRicebookWidget(
                ricebook: item as RicebookPackageModel,
              );
            },
          ),
        ],
      ),
    );
  }
}
