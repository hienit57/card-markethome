import 'package:card_markethome/index.dart';

extension BrightnessExt on Brightness {
  ThemeColor getThemeColor() {
    return this == Brightness.light ? ThemeColorLight() : ThemeColorDark();
  }
}

extension ThemeDataExt on ThemeData {
  ThemeColor get themeColor => brightness.getThemeColor();

  ThemeDecoration get themeDecoration => ThemeDecoration(this);

  ThemeDisplayMetric get themeDisplayMetric => const ThemeDisplayMetric();

  String get fontFamily => Fonts.inter;

  ThemeData getTheme(Brightness brightness, {Map<String, dynamic>? themeJson}) {
    final dataThemeColor = brightness.getThemeColor();
    final themeText = ThemeText(
      fontFamily,
      themeColor: dataThemeColor,
    );
    final newTextTheme = themeText.getTextTheme;

    return ThemeData(
      brightness: brightness,
      fontFamily: fontFamily,
      textTheme: newTextTheme,
      primaryTextTheme: newTextTheme,
      scaffoldBackgroundColor: dataThemeColor.backgroundColor,
      colorScheme: colorScheme.copyWith(
        primary: dataThemeColor.primary,
        brightness: brightness,
        secondary: dataThemeColor.accent,
        error: dataThemeColor.error,
      ),
      primaryColor: dataThemeColor.primary,
    );
  }
}
