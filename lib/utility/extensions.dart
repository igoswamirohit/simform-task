import 'package:flutter/material.dart';

import 'globals.dart';

extension SizedBoxCreation on num {
  Widget sizedBoxHeight() {
    return SizedBox(height: toDouble());
  }

  Widget sizedBoxWidth() {
    return SizedBox(width: toDouble());
  }

  TextStyle get semiBoldStyle =>
      semiBold.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get regularStyle =>
      regular.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get boldStyle =>
      bold.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get italicStyle =>
      italic.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get blackStyle => 
      black.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get mediumStyle =>
      medium.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get thinStyle =>
      thin.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get lightStyle =>
      light.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get extraLightStyle =>
      extraLight.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
  TextStyle get extraBoldStyle =>
      extraBold.copyWith(fontSize: toDouble(), fontFamily: 'Poppins');
}

extension StringExtensions on String {
  Widget richText(TextStyle style, List<TextSpan> children) {
    return RichText(
      text: TextSpan(
        text: this,
        style: style,
        children: children,
      ),
    );
  }
}

extension ContextExtensions on BuildContext {
  void nextEditableTextFocus() {
    if (FocusScope.of(this).focusedChild?.context?.widget is! EditableText) {
      FocusScope.of(this).nextFocus();
    }
  }
}
