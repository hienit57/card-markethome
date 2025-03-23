import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpWidgetConstants {
  static const int digitNumberLimit = 6;
  static const String defaultCharacter = '';
  static const String otpTextfieldKey = 'otp_textfield_key_';

  static const double paddingHorizontal = 16;
  static const double paddingVertical = 16;

  static const double otpFieldWidth = 44;
  static const double otpFieldHeight = 60;
  static const double otpFieldBorderWidth = 1;
  static const double otpTextfieldSize = 30;
  static const double otpFieldRadiusCorner = 5;
}

class OtpWidget extends StatefulWidget {
  const OtpWidget({
    super.key,
    this.controller,
    this.onOtpChanged,
    this.title,
    this.textColor,
    this.selectedColor,
    this.activeColor,
  });
  final void Function(String)? onOtpChanged;
  final TextEditingController? controller;
  final String? title;
  final Color? textColor;
  final Color? selectedColor;
  final Color? activeColor;

  @override
  OtpWidgetState createState() => OtpWidgetState();
}

class OtpWidgetState extends State<OtpWidget> with WidgetsBindingObserver {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = widget.controller ?? TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.textColor ?? Theme.of(context).primaryColor;
    final Color selectedColor = widget.selectedColor ?? const Color(0xFFFFAA03);
    final Color activeColor = widget.activeColor ?? Colors.black;

    return Column(
      children: <Widget>[
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: OtpWidgetConstants.paddingVertical,
            ),
            child: Text(
              widget.title!,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        PinCodeTextField(
          autoFocus: true,
          appContext: context,
          length: OtpWidgetConstants.digitNumberLimit,
          animationType: AnimationType.fade,
          textStyle: TextStyle(
            fontSize: OtpWidgetConstants.otpTextfieldSize,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
            borderWidth: OtpWidgetConstants.otpFieldBorderWidth,
            fieldHeight: OtpWidgetConstants.otpFieldHeight,
            fieldWidth: OtpWidgetConstants.otpFieldWidth,
            selectedColor: selectedColor,
            activeColor: activeColor,
            inactiveColor: textColor,
          ),
          cursorColor: selectedColor,
          animationDuration: const Duration(milliseconds: 300),
          controller: _textEditingController,
          keyboardType: TextInputType.number,
          onChanged: onOtpTextfieldChanged,
          beforeTextPaste: (String? text) => false,
        ),
      ],
    );
  }

  void onOtpTextfieldChanged(String value) {
    widget.onOtpChanged?.call(value);
  }
}
