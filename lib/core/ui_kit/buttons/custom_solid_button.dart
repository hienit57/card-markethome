import 'package:card_markethome/core/index.dart';
import 'package:flutter/material.dart';

class CustomSolidButton extends StatelessWidget {
  const CustomSolidButton({
    super.key,
    this.isLoading = false,
    this.width,
    this.height,
    this.padding,
    this.radius,
    this.backgroundColor,
    this.gradient,
    this.title = '',
    required this.onTap,
    this.disabled = false,
    this.prefix,
    this.disableColor = AppColors.gray300,
    this.titleStyle,
    this.widget,
  });

  final bool isLoading;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double? radius;

  final Color? backgroundColor;
  final LinearGradient? gradient;

  final Widget? prefix;

  final Widget? widget;
  final TextStyle? titleStyle;
  final String title;

  final Function()? onTap;

  final bool disabled;
  final Color? disableColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height ?? 48,
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius ?? 8),
              color: disabled ? disableColor : backgroundColor,
              gradient: gradient,
              // disabled
              //     ? disableColor
              //     : gradient != null
              //         ? null
              //         : (color ?? Colors.amber).withOpacity(disabled ? .2 : 1),
              // gradient: disabled ? null : gradient,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefix != null)
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      child: prefix,
                    ),
                  Center(
                    child: widget ??
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: titleStyle ??
                              context.text.titleLarge?.copyWith(
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                        ),
                  ),
                ],
              ),
            ),
          ),
          if (isLoading)
            const Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: Center(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
