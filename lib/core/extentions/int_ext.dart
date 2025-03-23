import 'package:intl/intl.dart';

extension IntExt on int {
  String get formatTimer {
    final duration = Duration(seconds: this);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final secs = duration.inSeconds.remainder(60);

    // Format the timer string
    return '$hours:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  String get stringNum {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(this).toLowerCase().replaceAll('.', ',');
  }

  int get notZero {
    return this < 0 ? 0 : this;
  }

  String get likeFormatted {
    if (this < 10000) {
      final formatter = NumberFormat.decimalPattern('vi_VN');
      return formatter.format(this);
    }
    return stringNum.toUpperCase().replaceAll(',', '.');
  }

  String get dotNumberFormatted {
    if (this < 10000) {
      final formatter = NumberFormat.decimalPattern('vi_VN');
      return formatter.format(this);
    }
    return stringNum.toUpperCase().replaceAll(',', '.');
  }

  String get formatTotalVNLocale {
    if (this < 1000) {
      return toString();
    }

    double formattedNumber;
    String unit;

    if (this < 1000000) {
      formattedNumber = this / 1000;
      unit = 'Nghìn';
    } else if (this < 1000000000) {
      formattedNumber = this / 1000000;
      unit = 'Triệu';
    } else {
      formattedNumber = this / 1000000000;
      unit = 'Tỷ';
    }

    String formattedString =
        formattedNumber.toStringAsFixed(2).replaceAll('.', ',');

    formattedString = _removeTrailingZeros(formattedString);

    return '$formattedString $unit';
  }

  String _removeTrailingZeros(String input) {
    if (input.contains(',')) {
      List<String> parts = input.split(',');

      if (parts.length > 1 && int.parse(parts[1]) == 0) {
        return parts[0];
      }
    }

    return input;
  }

  String get durationFormatted {
    final int hours = this ~/ 3600;
    final int minutes = (this % 3600) ~/ 60;
    final int remainingSeconds = this % 60;

    return hours > 0
        // ignore: lines_longer_than_80_chars
        ? '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}'
        // ignore: lines_longer_than_80_chars
        : '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

extension CurrencyExt on num? {
  String toAppCurrencyString({bool isWithSymbol = true, String? locale}) {
    return NumberFormat.currency(
      locale: locale ?? 'vi',
      symbol: isWithSymbol ? ' đ' : '',
      customPattern: '#,###${isWithSymbol ? '\u00a4' : ''}',
    ).format(this ?? 0);
  }
}

extension IntNullExt on int? {
  int get getNumber {
    return this ?? 0;
  }
}
