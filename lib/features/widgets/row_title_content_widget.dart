import 'package:card_markethome/index.dart';

class RowTitleContentWidget extends StatelessWidget {
  const RowTitleContentWidget({
    super.key,
    required this.title,
    this.titleStyle,
    required this.content,
    this.contentStyle,
    this.onTap,
  });

  final String title;
  final TextStyle? titleStyle;

  final String content;
  final TextStyle? contentStyle;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ??
                context.text.titleSmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                content,
                style: contentStyle ??
                    context.text.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
