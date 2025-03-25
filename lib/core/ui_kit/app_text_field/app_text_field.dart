import 'package:card_markethome/index.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.placeholder,
    this.minLine,
    this.focusNode,
    this.readOnly,
    this.controller,
    //this.textFieldStyle,
    this.obscureText = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.validator,
    this.enabled,
    this.onChanged,
    this.inputFormatters,
    this.prefix,
    this.initialValue,
    this.maxLines = 1,
    this.borderRadius,
    this.contentPadding,
    this.autovalidateMode,
    this.borderColor,
    this.textInputAction,
    this.onTap,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.inpuDecoration,
    this.onFieldSubmitted,
    this.maxLength,
    this.onEditingComplete,
    this.hasHiddenWhenTapOutside = true,
    this.hintStyle,
  });

  final String? placeholder;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final EdgeInsets? contentPadding;
  final bool? readOnly;
  final Function()? onTap;

  //final TextFieldStyle? textFieldStyle;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final Widget? suffix;
  final int? minLine;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final int? maxLines;
  final double? borderRadius;
  final Color? borderColor;
  final AutovalidateMode? autovalidateMode;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? inpuDecoration;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final int? maxLength;
  final bool hasHiddenWhenTapOutside;

  final TextStyle? hintStyle;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
      ),
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        textInputAction: widget.textInputAction ?? TextInputAction.done,
        minLines: widget.minLine ?? 1,
        maxLength: widget.maxLength,
        autovalidateMode:
            widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
        enableInteractiveSelection: true,

        contextMenuBuilder: (context, editableTextState) {
          return AdaptiveTextSelectionToolbar.editableText(
            editableTextState: editableTextState,
          );
        },

        initialValue: widget.initialValue,
        controller: widget.controller,
        textAlign: widget.textAlign,
        onTap: widget.onTap,
        inputFormatters: widget.inputFormatters,
        onFieldSubmitted: widget.onFieldSubmitted,
        onEditingComplete: widget.onEditingComplete,
        enableSuggestions: false,
        autocorrect: false,
        style: TextStyle(
          color: widget.textColor ?? AppColors.neutral500,
          fontSize: widget.fontSize ?? 14,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          //fontFamily: AppFonts.svnGotham,
          decoration: widget.inpuDecoration,
        ),
        decoration: InputDecoration(
          errorMaxLines: 3,
          errorStyle: const TextStyle(
            color: Colors.red,
            fontSize: 12,
          ),
          contentPadding: widget.contentPadding ??
              const EdgeInsets.only(left: 24, right: 12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.colorE8E8E8,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.neutral300,
            ),
          ),
          hintText: widget.placeholder,
          hintStyle: widget.hintStyle ??
              context.text.bodySmall?.copyWith(
                color: AppColors.color868686,
                fontSize: 12,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.neutral500,
            ),
          ),
          suffixIcon: widget.suffix != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: widget.suffix,
                )
              : const SizedBox(),
          suffixIconConstraints: const BoxConstraints(),
          prefixIcon: widget.prefix,
        ),
        focusNode: widget.focusNode,
        //style: textFieldStyle?.textStyle,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        enabled: widget.enabled,
        onChanged: widget.onChanged,
        maxLines: widget.maxLines,
      ),
    );
  }
}
