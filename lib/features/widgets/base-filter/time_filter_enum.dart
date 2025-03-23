enum TimeFilterEnum {
  today,
  week,
  month,
  select,
  other;

  String get title {
    switch (this) {
      case TimeFilterEnum.today:
        return '';
      case TimeFilterEnum.week:
        return '';
      case TimeFilterEnum.month:
        return '';
      case TimeFilterEnum.select:
        return '';
      case TimeFilterEnum.other:
        return '';
    }
  }
}

enum PriceEnum {
  price0_1000k(0, 1000000, 'Từ 0 - 1.000.000đ'),
  price1000k_5000k(1000000, 5000000, '1.000.000đ - 5.000.000đ'),
  price5000k(1000000, null, '> 5.000.000đ'),
  other(0, 0, 'Khác');

  final int min;
  final int? max;
  final String title; // ✅ Thêm thuộc tính title

  const PriceEnum(this.min, this.max, this.title);
}
