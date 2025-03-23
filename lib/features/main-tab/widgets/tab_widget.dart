import 'package:card_markethome/features/index.dart';
import 'package:card_markethome/index.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    super.key,
    required this.isSelected,
    required this.tabEnum,
  });

  final bool isSelected;
  final TabsEnum tabEnum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          if (isSelected) ...[
            tabEnum.iconSelected
          ] else ...[
            tabEnum.iconOutline,
          ],
          const SizedBox(height: 2),
          Text(
            tabEnum.title,
            style: context.text.titleMedium?.copyWith(
              fontSize: 12,
              color: isSelected ? AppColors.textAccent : AppColors.color5E5E5E,
            ),
          ),
        ],
      ),
    );
  }
}
