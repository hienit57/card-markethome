import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String? getCurrencyKShow(Object? value) {
  if (value == null) return "0";
  if (value is String) {
    try {
      return getCurrencyKShow(double.parse(value));
    } catch (e) {
      return value;
    }
  } else if (value is num) {
    if (value < 999) {
      return value.toString();
    } else {
      return '${NumberFormat("#,###").format(value / 1000)}k';
    }
  } else {
    return "error";
  }
}

String getCurrencyFullShow(Object? value) {
  if (value == null) return "0";
  if (value is String) {
    try {
      return getCurrencyFullShow(double.parse(value));
    } catch (e) {
      return value;
    }
  } else if (value is num) {
    if (value < 999) {
      return value.toString();
    } else {
      final result = NumberFormat("#,##0").format(value);
      return result;
    }
  } else {
    return "error";
  }
}

class CurrencyFormatter extends TextInputFormatter {
  static const separator = '.';

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final oldValueText = oldValue.text.replaceAll(separator, '');
    final newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      return newValue.copyWith(
          text: newValueText, selection: newValue.selection);
    }

    if (oldValueText != newValueText) {
      final chars = newValueText.split('');

      final newString = chars.reversed
          .fold<String>('', (previousValue, element) => element + previousValue)
          .replaceAllMapped(
              RegExp(r'.{3}'), (match) => '${match.group(0)}$separator')
          .replaceAll(RegExp('^\\$separator|\$'), '');

      final selectionIndex = newString.length - newValue.selection.extentOffset;

      return TextEditingValue(
        text: newString,
        selection:
            TextSelection.collapsed(offset: newString.length - selectionIndex),
      );
    }

    return newValue;
  }
}

extension StringParsing on int {
  String convertToString() {
    const units = <int, String>{
      1000000000: 'B',
      1000000: 'M',
      1000: 'K',
    };

    if (this < 10000) {
      final numberFormat = RegExp(r'\B(?=(\d{3})+(?!\d))');
      return toString().replaceAllMapped(numberFormat, (match) => '.');
    }

    return units.entries
        .map((e) => '${this ~/ e.key}${e.value}')
        .firstWhere((e) => !e.startsWith('0'), orElse: () => '$this');
  }
}
