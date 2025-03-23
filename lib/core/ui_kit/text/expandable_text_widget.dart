import 'package:card_markethome/index.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  final int lengthExpandable;

  const ExpandableTextWidget({
    super.key,
    required this.text,
    required this.lengthExpandable,
  });

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  final ValueNotifier<bool> isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isExpanded,
      builder: (context, expanded, child) {
        if (widget.text.length <= widget.lengthExpandable) {
          return Text(
            widget.text,
            style: context.text.titleSmall,
          );
        }

        final displayText = expanded
            ? widget.text
            : "${widget.text.substring(0, widget.lengthExpandable)}... ";

        return GestureDetector(
          onTap: () => isExpanded.value = !expanded,
          child: RichText(
            text: TextSpan(
              text: displayText,
              style: context.text.titleSmall?.copyWith(
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: expanded ? " Thu gọn" : "Xem thêm",
                  style: context.text.titleSmall?.copyWith(
                    color: AppColors.textAccent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
