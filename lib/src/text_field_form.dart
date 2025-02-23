// lib/src/text_field_form.dart

import 'package:flutter/material.dart';

/// Defines the behavior styles for the label in the text field
enum LabelBehaviorStyles {
  /// The label will always be positioned within the content, or hidden
  labelNever,

  /// The label will float when the input is focused, or has content
  labelAuto,

  /// The label will always float above the content
  labelAlways,

  /// The label will always be outside the content
  labelExternal,
}

/// A highly customizable text form field that supports various styling options
/// and validation features
class TextFormFieldFlutter extends FormField<String> {
  TextFormFieldFlutter({
    Key? key,
    TextEditingController? controller,
    TextInputType? keyboardType,
    required String labelText,
    required String hintText,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    LabelBehaviorStyles labelBehaviorStyles = LabelBehaviorStyles.labelExternal,
    Color? hintColor,
    Color? labelColor,
    Color? borderColor,
    Color? enabledBorderColor,
    Color? focusedBorderColor,
    Color? fillColor,
    bool readOnly = false,
    void Function()? onTap,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool obscureText = false,
    double? borderRadius,
    double? labelFontSize,
    double? hintFontSize,
    double? externalLabelGap,
    TextInputAction? textInputAction,
    AutovalidateMode? autovalidateMode,
    int? maxLines = 1,
    int? minLines = 1,
  }) : super(
    key: key,
    validator: validator,
    initialValue: controller?.text ?? '',
    autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
    builder: (FormFieldState<String> state) {
      if (controller != null) {
        controller.addListener(() {
          state.didChange(controller.text);
        });
      }
      final errorColor = state.hasError ? Colors.red : null;

      return _CustomTextFieldBuilder(
        controller: controller,
        keyboardType: keyboardType,
        fillColor: fillColor ?? Colors.white70,
        hintColor: hintColor ?? Colors.black38,
        hintText: hintText,
        borderRadius: borderRadius ?? 8.0,
        borderColor: errorColor ?? (borderColor ?? Colors.transparent),
        labelFontSize: labelFontSize ?? 14.0,
        hintFontSize: hintFontSize ?? 12.0,
        labelText: labelText,
        labelColor: errorColor ?? (labelColor ?? Colors.black87),
        externalLabelGap: externalLabelGap ?? 8.0,
        obscureText: obscureText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        onChanged: (value) {
          state.didChange(value);
          onChanged?.call(value);
        },
        onTap: onTap,
        readOnly: readOnly,
        enabledBorderColor: errorColor ?? (enabledBorderColor ?? Colors.transparent),
        focusedBorderColor: errorColor ?? (focusedBorderColor ?? Colors.grey),
        labelBehaviorStyles: labelBehaviorStyles,
        errorText: state.errorText,
        textInputAction: textInputAction ?? TextInputAction.next,
        maxLines: maxLines,
        minLines: minLines,
      );
    },
  );
}

/// Internal widget builder for the custom text field
class _CustomTextFieldBuilder extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final String hintText;
  final Function(String)? onChanged;
  final LabelBehaviorStyles labelBehaviorStyles;
  final Color hintColor;
  final Color labelColor;
  final Color borderColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final double borderRadius;
  final double labelFontSize;
  final double hintFontSize;
  final double externalLabelGap;
  final String? errorText;
  final TextInputAction textInputAction;
  final int? maxLines;
  final int? minLines;

  const _CustomTextFieldBuilder({
    required this.labelText,
    required this.hintText,
    required this.hintColor,
    required this.labelColor,
    required this.borderColor,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.fillColor,
    required this.borderRadius,
    required this.labelFontSize,
    required this.hintFontSize,
    required this.externalLabelGap,
    required this.labelBehaviorStyles,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.errorText,
    this.textInputAction = TextInputAction.next,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelBehaviorStyles == LabelBehaviorStyles.labelExternal &&
            labelText.isNotEmpty) ...[
          Text(
            labelText,
            style: TextStyle(
              fontSize: labelFontSize,
              color: errorText != null ? Colors.red : labelColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: externalLabelGap),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          readOnly: readOnly,
          maxLines: maxLines,
          minLines: minLines,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onTap: onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            fillColor: fillColor,
            filled: true,
            errorText: errorText,
            border: _buildBorder(borderColor),
            focusedBorder: _buildBorder(focusedBorderColor),
            enabledBorder: _buildBorder(enabledBorderColor),
            errorBorder: _buildBorder(Colors.red),
            focusedErrorBorder: _buildBorder(Colors.red),
            hintText: hintText,
            hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintFontSize,
              fontWeight: FontWeight.normal,
            ),
            labelText: labelBehaviorStyles != LabelBehaviorStyles.labelExternal
                ? labelText
                : null,
            labelStyle: TextStyle(
              color: labelColor,
              fontSize: labelFontSize,
              fontWeight: FontWeight.normal,
            ),
            floatingLabelBehavior: _getFloatingLabelBehavior(),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }

  InputBorder _buildBorder(Color color) {
    return borderRadius > 0
        ? OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      borderSide: BorderSide(color: color),
    )
        : InputBorder.none;
  }

  FloatingLabelBehavior? _getFloatingLabelBehavior() {
    switch (labelBehaviorStyles) {
      case LabelBehaviorStyles.labelAuto:
        return FloatingLabelBehavior.auto;
      case LabelBehaviorStyles.labelAlways:
        return FloatingLabelBehavior.always;
      case LabelBehaviorStyles.labelNever:
        return FloatingLabelBehavior.never;
      default:
        return null;
    }
  }
}