import 'package:card_markethome/index.dart';

class CardDetailTextInforWidget extends StatelessWidget {
  const CardDetailTextInforWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textDemo =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eu nisl in sem dictum efficitur quis id ante. Pellentesque id suscipit erat suscipit.';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'THÔNG TIN CHI TIẾT THẺ',
            style: context.text.titleMedium?.copyWith(),
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ExpandableTextWidget(
            text: textDemo,
            lengthExpandable: 146,
          ),
        )
      ],
    );
  }
}
