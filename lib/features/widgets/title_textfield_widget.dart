import 'package:card_markethome/index.dart';

class TitleTextfieldWidget extends StatelessWidget {
  const TitleTextfieldWidget({
    super.key,
    this.readOnly = false,
    required this.title,
    this.isRequired = true,
    this.controller,
    this.placeHolder,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  final bool readOnly;

  final String title;
  final bool isRequired;

  final TextEditingController? controller;
  final String? placeHolder;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.text.titleMedium?.copyWith(
                fontSize: 12,
              ),
            ),
            if (isRequired) ...[
              Text(
                ' *',
                style: context.text.titleMedium?.copyWith(
                  fontSize: 12,
                  color: AppColors.red500,
                ),
              ),
            ]
          ],
        ),
        const SizedBox(height: 6),
        AppTextField(
          readOnly: readOnly,
          placeholder: placeHolder,
          controller: controller,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          borderRadius: 8,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          validator: validator,
        )
      ],
    );
  }
}
