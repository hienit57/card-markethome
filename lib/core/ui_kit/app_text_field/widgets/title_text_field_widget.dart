import 'package:card_markethome/index.dart';
import 'package:flutter/services.dart';

class TitleTextFieldWidget extends StatelessWidget {
  const TitleTextFieldWidget({
    super.key,
    this.title,
    this.placeHolder,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onTap,
    this.suffix,
  });

  final String? title;
  final String? placeHolder;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onTap;

  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title?.replaceAll('*', '') ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 20 / 14,
                color: AppColors.gray800,
              ),
            ),
            if (title?.trim().contains('*') ?? false) ...[
              const Text(
                '*',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                  color: AppColors.red500,
                ),
              ),
            ]
          ],
        ),
        const SizedBox(height: 4),
        AppTextField(
          controller: controller,
          placeholder: placeHolder,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 10,
          ),
          borderRadius: 8,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onTap: onTap,
          suffix: suffix,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
