import 'package:flutter/material.dart';

class ThemeDecoration {
  const ThemeDecoration(this._theme);

  final ThemeData _theme;

  BoxDecoration get appBarGradient => const BoxDecoration();

  BoxDecoration get textShadow => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            _theme.colorScheme.surface,
            Colors.white.withOpacity(.2),
          ],
        ),
      );

  List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
        ),
      ];

  BoxDecoration get panelBottomShadow => BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: _theme.scaffoldBackgroundColor,
      );

  BoxDecoration get card => BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      );

  InputBorder get textInputBorderSocial => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.transparent, width: 0),
      );

  InputBorder get textInputBorderNone => OutlineInputBorder(
        borderRadius: BorderRadius.circular(1),
        borderSide: BorderSide.none,
      );
  InputBorder get textInputSearchBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide.none,
      );
}
