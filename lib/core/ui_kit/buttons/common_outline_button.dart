import 'package:card_markethome/core/index.dart';
import 'package:flutter/material.dart';

class CommonOutlineButton extends StatelessWidget {
  const CommonOutlineButton({
    super.key,
    required this.title,
    required this.colorOutline,
    required this.onPressed,
    this.child,
    this.borderRadius,
    this.width,
    this.borderWidth,
    this.height = 48.0,
    this.backgroundColor,
    this.padding,
  });

  final String title;
  final Color colorOutline;
  final BorderRadiusGeometry? borderRadius;

  final double? width;
  final double height;
  final double? borderWidth;
  final VoidCallback onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(10),
            side: BorderSide(
              color: colorOutline,
              width: borderWidth ?? 1,
            ),
          ),
          backgroundColor: backgroundColor ?? AppColors.white,
        ),
        onPressed: onPressed,
        child: child ??
            Text(
              title,
              style: context.text.titleLarge?.copyWith(
                fontSize: 16,
                color: colorOutline,
              ),
            ),
      ),
    );
  }
}
