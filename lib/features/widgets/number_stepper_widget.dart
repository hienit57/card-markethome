import 'package:card_markethome/index.dart';
import 'package:flutter/services.dart';

class NumberStepperWidget extends StatefulWidget {
  const NumberStepperWidget({
    super.key,
    required this.initialValue,
    required this.sizeButton,
    required this.radiusButton,
    required this.onChange,
    this.maxValue = 0,
  });

  final int initialValue;
  final double sizeButton;
  final double radiusButton;
  final Function(int) onChange;
  final int maxValue;

  @override
  State<NumberStepperWidget> createState() => _NumberStepperWidgetState();
}

class _NumberStepperWidgetState extends State<NumberStepperWidget> {
  final ValueNotifier<int> _valueInput = ValueNotifier(0);

  void _updateValue(int delta) {
    final newValue = _valueInput.value + delta;
    if (newValue >= 0 &&
        (widget.maxValue == 0 || newValue <= widget.maxValue)) {
      _valueInput.value = newValue;
      widget.onChange(newValue);
    }
  }

  bool _isDecrementEnabled() => _valueInput.value > 1;

  bool _isIncrementEnabled() =>
      widget.maxValue == 0 ||
      (_valueInput.value < widget.maxValue && widget.maxValue > 1);

  @override
  void initState() {
    _valueInput.value = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _valueInput,
        builder: (context, value, child) {
          return TapRegion(
            onTapOutside: (event) {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Row(
              children: <Widget>[
                _buildButton(
                  isPlus: false,
                  enabled: _isDecrementEnabled(),
                  onPressed: () => _updateValue(-1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    value.toString(),
                    style: context.text.titleLarge!.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                _buildButton(
                  isPlus: true,
                  enabled: _isIncrementEnabled(),
                  onPressed: () => _updateValue(1),
                ),
                kSpacingWidth2,
              ],
            ),
          );
        });
  }

  Widget _buildButton({
    required bool isPlus,
    bool enabled = false,
    required VoidCallback onPressed,
  }) {
    final color = enabled ? AppColors.blueEdit : AppColors.neutral200;

    return GestureDetector(
      onTap: enabled ? onPressed : null,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          width: widget.sizeButton,
          height: widget.sizeButton,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radiusButton),
            border: Border.all(color: color),
          ),
          child: isPlus
              ? AppImage(
                  assetImage: Assets.lib_assets_icons_ic_plus,
                  color: color,
                )
              : AppImage(
                  assetImage: Assets.lib_assets_icons_ic_minus,
                  color: color,
                ),
        ),
      ),
    );
  }
}

class MaxValueTextInputFormatter extends TextInputFormatter {
  final int maxValue;

  MaxValueTextInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final intValue = int.tryParse(newValue.text);
    if (intValue != null && intValue > maxValue) {
      return oldValue;
    }

    return newValue;
  }
}
