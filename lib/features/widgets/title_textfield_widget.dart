import 'package:card_markethome/index.dart';

class TitleTextfieldWidget extends StatefulWidget {
  const TitleTextfieldWidget({
    super.key,
    this.readOnly = false,
    required this.title,
    this.isRequired = true,
    this.controller,
    this.focusNode,
    this.placeHolder,
    this.onChanged,
    this.validator,
    this.inputFormatters,
  });

  final bool readOnly;

  final String title;
  final bool isRequired;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeHolder;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<TitleTextfieldWidget> createState() => _TitleTextfieldWidgetState();
}

class _TitleTextfieldWidgetState extends State<TitleTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: context.text.titleMedium?.copyWith(
                fontSize: 12,
              ),
            ),
            if (widget.isRequired) ...[
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
          readOnly: widget.readOnly,
          placeholder: widget.placeHolder,
          controller: widget.controller,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          borderRadius: 8,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          validator: widget.validator,
          focusNode: widget.focusNode,
        )
      ],
    );
  }
}
