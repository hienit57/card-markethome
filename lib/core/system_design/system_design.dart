import 'package:card_markethome/index.dart';

extension Ctx on BuildContext {
  Size get size => MediaQuery.of(this).size;

  double get maxWidth => MediaQuery.of(this).size.width;

  double get maxHeight => MediaQuery.of(this).size.height;

  double get paddingTop => MediaQuery.of(this).padding.top;

  TextTheme get text => Theme.of(this).textTheme;
  //ThemeDecoration get themeDecoration => Theme.of(this).themeDecoration;

  double get horizontal => MediaQuery.of(this).size.width > 375 ? 24 : 12;

  double get horizontal12 => MediaQuery.of(this).size.width > 375 ? 12 : 10;

  bool get isTablet => MediaQuery.of(this).size.width > 500;

  bool get isLargeScreen =>
      MediaQuery.of(this).size.height >= 670 &&
      MediaQuery.of(this).size.width > 375;

  bool get isMediumScreen =>
      MediaQuery.of(this).size.height >= 670 &&
      MediaQuery.of(this).size.width <= 375;

  bool get isSmallDevice => MediaQuery.of(this).size.height <= 670;

  double get minimumSafeArea => MediaQuery.of(this).size.height > 375 ? 16 : 10;

  bool get isHideKeyboard => MediaQuery.of(this).viewInsets.bottom == 0;

  bool get isPhoneX => MediaQuery.of(this).padding.top != 0;

  Widget get divider =>
      const Divider(height: 0, color: AppColors.grey12, thickness: 9);

  double get kPaddingToolBar => MediaQuery.of(this).viewPadding.top;
}

const paddingHorizontal = 25.0;
const bannerRatio = 400 / 120;
const kPaddingHorizontal = 20.0;
