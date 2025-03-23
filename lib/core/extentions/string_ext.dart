// ignore_for_file: join_return_with_assignment

import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

extension StringExt on String {
  bool get isNotEmptyData => isNotEmpty && toUpperCase() != 'NULL';

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String get htmlToString => Bidi.stripHtmlIfNeeded(this);

  bool get isPathVideo =>
      ['mp4', 'mov'].contains(split('.').last.toLowerCase());

  bool get isVideoUrl {
    final videoExtensions = ['mp4', 'avi', 'mov', 'mkv'];
    final uri = Uri.parse(this);
    final extension = uri.path.split('.').last;
    return videoExtensions.contains(extension);
  }

  bool get isImage =>
      ['png', 'jpg', 'jpeg'].contains(split('.').last.toLowerCase());

  bool get isURL {
    const pattern =
        r'^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([\/\w .-]*)*\/?$';
    final regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  bool get isPath {
    return !isURL && (startsWith('/') || contains('/'));
  }

  String get capitalizeWord {
    final listString = toLowerCase().split(' ');
    listString.removeWhere((element) => element.isEmpty || element == ' ');
    return listString.map((e) => e.capitalize()).toList().join(' ');
  }

  Future<String?> get getFileSizeFromUrl async {
    final Uri uri = Uri.parse(this);
    final http.Response r = await http.head(uri);
    return r.headers['content-length'];
  }
}

extension StringMaybeNull on String? {
  bool isValidUrl() {
    final url = this ?? '';
    final Uri? uri = Uri.tryParse(url);
    return uri != null &&
        uri.hasAbsolutePath &&
        (uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https'));
  }

  String textWithPrefix([String? prefix]) {
    return (this?.isNotEmpty ?? false) ? '$this${prefix ?? ''}' : '';
  }

  String? removeTrailingZero() {
    if (this == null) {
      return '';
    }
    if (!this!.contains('.')) {
      return this;
    }
    var str = this!.replaceAll(RegExp(r'0*$'), '');
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  String? formatDiscount() {
    if (this == null) {
      return '';
    }
    if (!this!.contains('.')) {
      return this;
    }
    return this!.replaceFirst('.', ',');
  }

  Duration get secondsTrToDuration {
    if (this == null) {
      return Duration.zero;
    }

    final seconds = double.tryParse(this!);
    if (seconds != null) {
      final milliseconds = (seconds * 1000).toInt();

      return Duration(milliseconds: milliseconds);
    }

    return Duration.zero;
  }
}

extension StringFormatPhoneExt on String? {
  String? get formatPhone {
    if (this == null || this!.isEmpty) {
      return null;
    }
    return this?[0] == '0' ? this! : '0${this!}';
  }

  bool isJSON() {
    try {
      jsonDecode(this!);
    } catch (e) {
      return false;
    }
    return true;
  }

  String get toPhone {
    if (this == null) {
      return '';
    }
    return int.parse(this ?? '0').toString();
  }
}

extension ImagePathToBase64 on String {
  String toBase64() {
    final imageBytes = File(this).readAsBytesSync();
    return base64Encode(imageBytes);
  }
}

extension DatetimeFormat on String {
  String dateTimeDisplay() {
    final date = split(' ').first;
    final time =
        DateFormat.jm().format(DateFormat('hh:mm:ss').parse(split(' ').last));

    return '$date at $time';
  }

  DateTime parseDateTime({String? pattern}) {
    final DateFormat format = DateFormat(pattern ?? 'dd/MM/yyyy');
    final DateTime dateTime = format.parse(this);
    return dateTime;
  }

  String toddMMyyyy() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final DateTime dateTime = DateTime.parse(this).toLocal();
    final String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

  String toyyyMMddHHmm() {
    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final DateTime dateTime = DateTime.parse(this).toLocal();
    final String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }
}

extension NullableStringIsNullOrEmptyExtension on String? {
  /// Returns `true` if the String is either null or empty.
  bool get isNullOrEmpty => this?.isEmpty ?? true;
}

extension NullableStringIsNotNullOrEmptyExtension on String? {
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension DurationByStringExt on String {
  Duration parseDuration() {
    var hours = 0;
    var minutes = 0;
    var micros = 0;
    final parts = split(':');
    try {
      if (parts.isNotEmpty) {
        hours = int.parse(parts.first);
      }
      if (parts.length > 1) {
        minutes = int.parse(parts[1]);
      }
      if (parts.length > 2) {
        micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
      }
      return Duration(hours: hours, minutes: minutes, microseconds: micros);
    } catch (_) {
      return Duration.zero;
    }
  }
}

extension StringCheck on String {
  bool get hasNumber => RegExp(r'\d+').hasMatch(this);

  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(this);

  bool get hasAlphanumeric => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(this);
}

extension CheckIsNumber on String {
  bool isNumber() {
    return RegExp(r'^\d+$').hasMatch(this);
  }
}

extension ShortenId on String? {
  String shortenTransactionId() {
    if (this == null) {
      return '';
    }
    if (this!.length <= 8) {
      return toString();
    }
    return '#${this!.substring(0, 8).toUpperCase()}';
  }
}
