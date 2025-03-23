import 'package:card_markethome/index.dart';

class ThemeText {
  ThemeText(
    this.fontFamily, {
    required this.themeColor,
    TextTheme? textTheme,
  }) {
    _textTheme = TextTheme(
      displayLarge: styleByFontFamily(
        fontSize: 32,
        fontWeight: FontWeight.normal,
      ),

      displayMedium: styleByFontFamily(
        fontSize: 28,
        fontWeight: FontWeight.normal,
      ),

      displaySmall: styleByFontFamily(
        fontSize: 24,
        fontWeight: FontWeight.normal,
      ),

      headlineLarge: styleByFontFamily(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      headlineMedium: styleByFontFamily(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      headlineSmall: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      //Small text: TimeAgo - Share
      bodySmall: styleByFontFamily(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),

      labelMedium: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),

      bodyLarge: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      labelLarge: styleByFontFamily(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      titleLarge: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      titleMedium: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),

      titleSmall: styleByFontFamily(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
  late TextTheme _textTheme;
  final ThemeColor themeColor;
  final String fontFamily;

  TextTheme get getTextTheme => _textTheme;
  TextStyle get paragraph => _textTheme.bodyMedium!;
  TextStyle get paragraphExt => _textTheme.labelMedium!;
  TextStyle get smallText => _textTheme.bodySmall!;

  TextStyle get textButtonThemeStyle => _textTheme.labelLarge!.merge(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 16,
        ),
      );
  TextStyle get textTitleAppbarThemeStyle => _textTheme.labelLarge!.merge(
        TextStyle(
          fontFamily: fontFamily,
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 16,
        ),
      );
  TextStyle get tabBarThemeLabelStyle => _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ));

  TextStyle get tabBarThemeUnselectedLabelStyle =>
      _textTheme.bodyLarge!.merge(TextStyle(
        fontFamily: fontFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ));

  TextStyle styleByFontFamily({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      fontFamily: fontFamily ?? this.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: themeColor.textColor,
      package: 'card_markethome',
    );
  }
}
