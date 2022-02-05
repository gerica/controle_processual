import 'package:controle_processual/pages/widgets/text_field/input_decorations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_font_size.dart';

abstract class FieldWidget {
  TextFormField buildTextFieldCore(BuildContext context);
}

class InputTextWidget extends StatelessWidget implements FieldWidget {
  final String? errorText;
  final String? hintText;
  final String? prefixText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool keyboardSuggestions;
  final bool readOnly;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final int? heightMultiplier;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function() onFieldSubmitted;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final EdgeInsets? margin;
  final double height;
  double? width;
  final TextCapitalization? textCapitalization;
  final EdgeInsets? padding;
  final FocusNode? focusNode;
  final List<TextInputFormatter> formatters;
  final TextEditingController controller;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;
  final bool autofocus;
  final Color? background;
  final Color? borderColor;
  final TextInputAction textInputAction;

  InputTextWidget({
    required this.onFieldSubmitted,
    required this.controller,
    this.errorText,
    this.onChanged,
    this.onEditingComplete,
    this.focusNode,
    this.prefixIcon,
    this.prefixStyle,
    this.hintText,
    this.margin,
    this.suffixIcon,
    this.prefixText,
    this.textCapitalization,
    this.keyboardType,
    this.minLines,
    this.background,
    this.hintStyle,
    this.maxLength,
    this.maxLines = 1,
    this.borderColor,
    this.obscureText = false,
    this.keyboardSuggestions = false,
    this.readOnly = false,
    this.formatters = const [],
    this.heightMultiplier = 1,
    this.textAlign,
    this.padding,
    this.style,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.height = 40,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    if (this.width == null) {
      this.width = MediaQuery.of(context).size.width * 0.22;
    }
    return Container(
      height: height,
      width: width,
      child: buildTextFieldCore(context),
    );
  }

  TextFormField buildTextFieldCore(BuildContext context) {
    final decoration = InputDecorations(
      height: height,
      background: background,
      borderColor: borderColor,
      errorText: errorText,
      hintStyle: hintStyle,
      hintText: hintText,
      prefixIcon: prefixIcon,
      prefixText: prefixText,
      prefixStyle: prefixStyle,
      suffixIcon: suffixIcon,
    );

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textAlignVertical: TextAlignVertical.center,
      obscureText: obscureText,
      inputFormatters: formatters,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      enableSuggestions: keyboardSuggestions,
      autocorrect: keyboardSuggestions,
      maxLength: maxLength,
      textInputAction: textInputAction,
      maxLines: maxLines,
      readOnly: readOnly,
      minLines: minLines,
      style: style ?? TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textPrimary),
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        if (onEditingComplete != null) onEditingComplete!();
      },
      onFieldSubmitted: (_) {
        FocusScope.of(context).unfocus();
        onFieldSubmitted();
      },
      autofocus: autofocus,
      onChanged: onChanged,
      cursorColor: AppColorScheme.textPrimary,
      decoration: decoration.buildInputDecoration(),
    );
  }
}
