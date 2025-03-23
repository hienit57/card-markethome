// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter i18n`
  String get appTitle {
    return Intl.message(
      'Flutter i18n',
      name: 'appTitle',
      desc: 'Main application title',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Mã giới thiệu`
  String get referralCode {
    return Intl.message(
      'Mã giới thiệu',
      name: 'referralCode',
      desc: '',
      args: [],
    );
  }

  /// `Nhập ID MarShop giới thiệu`
  String get enterReferralCode {
    return Intl.message(
      'Nhập ID MarShop giới thiệu',
      name: 'enterReferralCode',
      desc: '',
      args: [],
    );
  }

  /// `Bạn chưa có MarShop giới thiệu ?`
  String get marshop_referral_code {
    return Intl.message(
      'Bạn chưa có MarShop giới thiệu ?',
      name: 'marshop_referral_code',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán`
  String get payment {
    return Intl.message(
      'Thanh toán',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin`
  String get infomation {
    return Intl.message(
      'Thông tin',
      name: 'infomation',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Lưu mã QR`
  String get save_qr_code {
    return Intl.message(
      'Lưu mã QR',
      name: 'save_qr_code',
      desc: '',
      args: [],
    );
  }

  /// `Bước 1: Lưu mã QR về điện thoại`
  String get payment_step1 {
    return Intl.message(
      'Bước 1: Lưu mã QR về điện thoại',
      name: 'payment_step1',
      desc: '',
      args: [],
    );
  }

  /// `Bước 2: Dùng app ngân hàng để tải mã QR`
  String get payment_step2 {
    return Intl.message(
      'Bước 2: Dùng app ngân hàng để tải mã QR',
      name: 'payment_step2',
      desc: '',
      args: [],
    );
  }

  /// `Bước 3: Xác nhận chuyển tiền`
  String get payment_step3 {
    return Intl.message(
      'Bước 3: Xác nhận chuyển tiền',
      name: 'payment_step3',
      desc: '',
      args: [],
    );
  }

  /// `Liên hệ`
  String get contact {
    return Intl.message(
      'Liên hệ',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ`
  String get home {
    return Intl.message(
      'Trang chủ',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin chia tiền`
  String get share_money_info {
    return Intl.message(
      'Thông tin chia tiền',
      name: 'share_money_info',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng gửi hình ảnh thanh toán thành công để việc xác nhận được diễn ra nhanh chóng`
  String get payment_sucess_content {
    return Intl.message(
      'Vui lòng gửi hình ảnh thanh toán thành công để việc xác nhận được diễn ra nhanh chóng',
      name: 'payment_sucess_content',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán thành công`
  String get payment_sucess {
    return Intl.message(
      'Thanh toán thành công',
      name: 'payment_sucess',
      desc: '',
      args: [],
    );
  }

  /// `Thanh toán thất bại`
  String get payment_fail {
    return Intl.message(
      'Thanh toán thất bại',
      name: 'payment_fail',
      desc: '',
      args: [],
    );
  }

  /// `Tổng tiền thanh toán`
  String get total_payment_money {
    return Intl.message(
      'Tổng tiền thanh toán',
      name: 'total_payment_money',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền MarShop nhận được:`
  String get marshop_money {
    return Intl.message(
      'Số tiền MarShop nhận được:',
      name: 'marshop_money',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền Boss Group nhận được:`
  String get boss_group_money {
    return Intl.message(
      'Số tiền Boss Group nhận được:',
      name: 'boss_group_money',
      desc: '',
      args: [],
    );
  }

  /// `Số tiền Boss Team nhận được:`
  String get boss_team_money {
    return Intl.message(
      'Số tiền Boss Team nhận được:',
      name: 'boss_team_money',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
