import 'package:intl/intl.dart';
//import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExt on DateTime {
  String get standardTimeFormat {
    final formatterDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get dateTimeDisplay {
    final formatterDate = DateFormat('MM/dd/yyyy');
    final formatterTime = DateFormat.jm();
    final actualDate = formatterDate.format(this);
    final actualTime = formatterTime.format(this);

    return '$actualDate at $actualTime';
  }

  String get tohhmm {
    final formatterDate = DateFormat('HH:mm');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get tohhmmLocal {
    final formatterDate = DateFormat('HH:mm');
    final actualDate = formatterDate.format(toLocal());

    return actualDate;
  }

  String get toALocal {
    final formatterDate = DateFormat('a');
    final actualDate = formatterDate.format(toLocal());

    return actualDate;
  }

  String get toHMmALocal {
    final formatterDate = DateFormat('h:mm a');
    final actualDate = formatterDate.format(toLocal());

    return actualDate;
  }

  String get toddMMyyyy {
    final formatterDate = DateFormat('dd MM yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toddMMMyyyy {
    final formatterDate = DateFormat('dd MMM yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toTimeString {
    final formatterDate = DateFormat('yyyy_dd_mm_hh_mm_ss');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get toYYYYmmdd {
    final formatterDate = DateFormat('yyyy-MM-dd');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get ddMMyyyy {
    final formatterDate = DateFormat('dd/MM/yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get formatServer {
    final formatterDate = DateFormat('yyyy-MM-dd');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get datetimeMessage {
    final formatterDate = DateFormat('dd/MM hh:mm');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get datetimeMessage2 {
    final formatterDate = DateFormat('dd/MM');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get datetimeDiscountProduct {
    DateFormat formatterDate = DateFormat('HH:mm dd/MM');
    if (DateTime.now().year != year) {
      formatterDate = DateFormat('HH:mm dd/MM/yyyy');
    }
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get dateTimeDisplayHHmmddMMyyyy {
    final formatterDate = DateFormat('HH:mm dd/MM/yyyy');

    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get datetimeLocal {
    final formatterDate = DateFormat('HH:mm dd/MM/yyyy');
    final actualDate = formatterDate.format(toLocal());

    return actualDate;
  }

  String get dateOrder {
    final formatterDate = DateFormat('MMM dd, yyyy hh:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get datePreOrder {
    final formatterDate = DateFormat('dd/MM/yyyy, HH:mm:ss');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get dateDiscountProduct {
    final formatterDate = DateFormat('yyyy/MM/dd HH:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get ddMM {
    final formatterDate = DateFormat('dd/MM');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get ddMMMM {
    final formatterDate = DateFormat('ddMMMM');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get eeddMMMMyyyy {
    final formatterDate = DateFormat('EE ,dd MMMM yyyy');
    final actualDate = formatterDate.format(this);

    return actualDate;
  }

  String get ddMMyyyyHHmm {
    final formatterDate = DateFormat('dd-MM-yyyy HH:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get ddMMyyyyHHmm2 {
    final formatterDate = DateFormat('dd/MM/yyyy HH:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get ddMMyyyyHHmm3 {
    final formatterDate = DateFormat('dd/MM/yyyy - HH:mm');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get dMMM {
    final formatterDate = DateFormat('d MMM');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get dMMMMVi {
    final formatterDate = DateFormat('d MMMM');
    final actualDate = formatterDate.format(this);

    return actualDate.replaceFirst('tháng', 'Tháng');
  }

  String get EEEEdMMMMy {
    final formatterDate = DateFormat('EEEE, d MMMM y');
    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  String get timeLastMessage {
    final timeNow = DateTime.now();
    late DateFormat formatterDate;
    if (timeNow.day == day) {
      formatterDate = DateFormat('hh:mm');
    } else {
      formatterDate = DateFormat('dd/MM hh:mm');
    }

    final actualDate = formatterDate.format(this);
    return actualDate;
  }

  // String get toHumanReadable {
  //   timeago.setLocaleMessages('vi_VN', timeago.ViMessages());

  //   return timeago.format(this, locale: Intl.getCurrentLocale());
  // }

  // String get timeComment {
  //   if (DateTime.now().subtract(const Duration(days: 1)).compareTo(this) > -1) {
  //     return datetimeMessage;
  //   }

  //   return toHumanReadable
  //       .replaceAll('một phút trước', 'Vừa xong')
  //       .replaceAll('a moment ago', 'Now')
  //       .replaceAll('a minute', 'Now')
  //       .replaceAll('khoảng ', '')
  //       .replaceAll(' phút', ' phút')
  //       .replaceAll(' tiếng', ' giờ')
  //       .replaceAll('trước', '');
  // }

  // String get timeMessage {
  //   if (DateTime.now().subtract(const Duration(days: 2)).compareTo(this) > -1) {
  //     return datetimeMessage2;
  //   }

  //   return toHumanReadable
  //       .replaceAll('một phút trước', 'Vừa xong')
  //       .replaceAll('a moment ago', 'Now')
  //       .replaceAll('a minute', 'Now')
  //       .replaceAll('khoảng ', '')
  //       .replaceAll(' phút', 'm')
  //       .replaceAll(' tiếng', 'h');
  // }

  String get timeMessagePhase2 {
    if (toLocal().isToday) {
      return '$tohhmmLocal Hôm nay';
    } else if (toLocal()
            .difference(DateTime.now().subtract(const Duration(days: 1)))
            .inDays ==
        0) {
      return '$tohhmmLocal Hôm qua';
    } else {
      return datetimeLocal;
    }
  }

  String get timeMessagePhase3 {
    if (toLocal().isToday) {
      return 'Hôm nay';
    } else if (toLocal()
            .difference(DateTime.now().subtract(const Duration(days: 1)))
            .inDays ==
        0) {
      return 'Hôm qua';
    } else {
      return datetimeLocal;
    }
  }

  bool isUnder18yearsAgo() =>
      (DateTime(DateTime.now().year, month, day).isAfter(DateTime.now())
          ? DateTime.now().year - year - 1
          : DateTime.now().year - year) <
      18;

  bool isUnder15yearsAgo() {
    final now = DateTime.now();
    final fifthteenYearsAgo = now.subtract(
      const Duration(days: 15 * 365),
    ); // Assuming 365 days in a year

    return isAfter(fifthteenYearsAgo);
  }

  String text() {
    return '''${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}''';
  }

  String formatDate() {
    return '''${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/${year.toString()}''';
  }

  int get getOld {
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - year;
    if (currentDate.month < month ||
        (currentDate.month == month && currentDate.day < day)) {
      age--;
    }
    return age;
  }

  int toLocalMonth() {
    return toLocal().month;
  }
}

extension DateOnlyCompare on DateTime {
  int dayLeft() {
    return difference(DateTime.now()).inDays;
  }

  bool get isToday {
    return isSameDay(DateTime.now());
  }

  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isBeforeDate(DateTime other) {
    return !isSameDay(other) && isBefore(other);
  }

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    bool? isUtc,
  }) {
    return ((isUtc ?? this.isUtc) ? DateTime.utc : DateTime.new)(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
    );
  }

  DateTime get startDate {
    return DateTime(year, month, day);
  }

  DateTime get middle {
    return DateTime(year, month, day, 12);
  }

  DateTime get endDate {
    return DateTime(year, month, day, 23, 59, 59, 999);
  }

  DateTime get startThisWeek {
    return subtract(Duration(days: weekday - 1)).startDate;
  }

  DateTime get endThisWeek {
    final DateTime now = DateTime.now();

    return add(Duration(days: 7 - now.weekday)).startDate;
  }

  DateTime get startPrevWeek {
    return subtract(Duration(days: weekday + 6)).startDate;
  }

  DateTime get endPrevWeek {
    return startPrevWeek.add(const Duration(days: 6)).endDate;
  }

  DateTime get prevMonth {
    return copyWith(month: month - 1);
  }

  DateTime get startThisMonth =>
      DateTime.now().subtract(Duration(days: DateTime.now().day - 1));

  DateTime get endThisMonth {
    final DateTime startOfNextMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 1);
    return startOfNextMonth.subtract(const Duration(days: 1));
  }

  DateTime get startPrevMonth {
    return prevMonth.copyWith(day: 1).startDate;
  }

  // DateTime get endPrevMonth {
  //   return startPrevMonth.let(
  //     (d) => d
  //         .copyWith(month: d.month + 1)
  //         .subtract(const Duration(days: 1))
  //         .endDate,
  //   );
  // }

  String get formatDateTimeToLocal {
    // if (this == null) {
    //   return '';
    // }
    // final String formattedDate =
    // DateFormat(typeFormat ?? "yyyy-MM-dd'T'HH:mm:ss'Z'").format(currentDate);
    // return formattedDate;
    // final formatterDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    //
    // final actualDate = formatterDate.format(this);
    // return actualDate;
    return this.toUtc().toString();
  }
}

extension DurationFormatting on Duration {
  String formatDuration() {
    int days = this.inDays;
    int hours = this.inHours % 24;
    int minutes = this.inMinutes % 60;
    int seconds = this.inSeconds % 60;

    return '$days ngày $hours giờ $minutes phút $seconds giây';
  }
}
