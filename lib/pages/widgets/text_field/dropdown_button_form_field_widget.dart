import 'package:controle_processual/pages/widgets/text_field/input_decorations.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_font_size.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropdownButtonFormFieldWidget extends StatelessWidget {
  final FocusNode? focusNode;
  final TextStyle? style;
  final bool autofocus;
  final Color? background;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? prefixText;
  final Widget? prefixIcon;
  final TextStyle? prefixStyle;
  final Color? borderColor;
  final double height;
  final double width;
  final String? errorText;
  final List<DropdownMenuItem> itens;
  final Function(dynamic) onChanged;
  final dynamic selected;
  final bool isExpanded;

  const DropdownButtonFormFieldWidget({
    required this.itens,
    required this.onChanged,
    required this.selected,
    this.focusNode,
    this.style,
    this.autofocus = false,
    this.background,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.prefixText,
    this.prefixIcon,
    this.prefixStyle,
    this.borderColor,
    this.height = 40,
    this.width = 250,
    this.errorText,
    this.isExpanded = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: buildTextFieldCore(context),
    );
  }

  DropdownButtonFormField buildTextFieldCore(BuildContext context) {
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
    return DropdownButtonFormField(
      focusNode: focusNode,
      value: selected,
      style: style ?? TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textPrimary),
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: decoration.buildInputDecoration(),
      items: itens,
      isExpanded: isExpanded,
    );
  }
}
