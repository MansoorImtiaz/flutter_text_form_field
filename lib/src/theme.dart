import 'package:flutter/material.dart';

/// Theme configuration for FlutterTextFormField
class TextFormFieldTheme {
  final Color? hintColor;
  final Color? labelColor;
  final Color? borderColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final Color? errorColor;
  final double? borderRadius;
  final double? labelFontSize;
  final double? hintFontSize;
  final double? externalLabelGap;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final FontWeight? labelFontWeight;
  final FontWeight? hintFontWeight;

  const TextFormFieldTheme({
    this.hintColor,
    this.labelColor,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.errorColor,
    this.borderRadius,
    this.labelFontSize,
    this.hintFontSize,
    this.externalLabelGap,
    this.contentPadding,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.labelFontWeight,
    this.hintFontWeight,
  });
}