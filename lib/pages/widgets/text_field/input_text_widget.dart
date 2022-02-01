import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_corner_radius.dart';
import 'package:controle_processual/utils/app_font_size.dart';
import 'package:controle_processual/utils/app_spacing.dart';

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
  final double? height;
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

  const InputTextWidget({
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
    this.height,
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
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => //
      Container(
        child: buildTextFieldCore(context),
      );

  TextFormField buildTextFieldCore(BuildContext context) => TextFormField(
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
        decoration: _buildInputDecoration(),
      );

  InputDecoration _buildInputDecoration() => InputDecoration(
        fillColor: background ?? AppColorScheme.white,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: suffixIcon ?? Container(height: 0, width: 0),
        ),
        labelText: hintText,
        labelStyle: TextStyle(color: AppColorScheme.gray1),
        disabledBorder: _buildBorderSide,
        enabledBorder: _buildBorderSide,
        prefix: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: prefixIcon,
        ),
        prefixText: prefixText,
        suffixIconConstraints: BoxConstraints(minHeight: height ?? 50),
        prefixStyle: prefixStyle,
        errorBorder: _buildInputErrorBorderSide,
        focusedBorder: _buildFocusedBorderSide,
        focusedErrorBorder: _buildInputErrorBorderSide,
        border: _buildBorderSide,
        hintStyle: hintStyle ?? TextStyle(fontSize: AppFontSize.primary, color: AppColorScheme.textSecondary),
        errorStyle: TextStyle(fontSize: AppFontSize.secondary, color: AppColorScheme.error),
        errorText: errorText,
        contentPadding: const EdgeInsets.only(left: AppSpacing.extraMedium, top: AppSpacing.small),
      );

  InputBorder get _buildFocusedBorderSide => OutlineInputBorder(
        borderRadius: const BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(width: 2, color: borderColor ?? AppColorScheme.darkBlue),
      );

  InputBorder get _buildInputErrorBorderSide => OutlineInputBorder(
        borderRadius: const BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(
          width: 1,
          color: AppColorScheme.error,
        ),
      );

  InputBorder get _buildBorderSide => const OutlineInputBorder(
        borderRadius: BorderRadius.all(AppCornerRadius.mini),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFD8D8D8),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('obscureText', obscureText))
      ..add(StringProperty('hintText', hintText))
      ..add(DiagnosticsProperty<TextInputType>('keyboardType', keyboardType))
      ..add(DiagnosticsProperty<TextEditingController>('controller', controller))
      ..add(IterableProperty<TextInputFormatter>('formatters', formatters))
      ..add(DiagnosticsProperty<bool>('keyboardSuggestions', keyboardSuggestions))
      ..add(DiagnosticsProperty<FocusNode>('focusNode', focusNode))
      ..add(IntProperty('maxLength', maxLength))
      ..add(IntProperty('maxLines', maxLines))
      ..add(IntProperty('heightMultiplier', heightMultiplier))
      ..add(DiagnosticsProperty<Function()>('onEditingComplete', onEditingComplete))
      ..add(DiagnosticsProperty<Function()>('onFieldSubmitted', onFieldSubmitted))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(EnumProperty<TextAlign>('textAlign', textAlign))
      ..add(StringProperty('errorText', errorText));
    properties.add(DiagnosticsProperty<TextStyle>('style', style));
    properties.add(DiagnosticsProperty<Function(String p1)>('onChanged', onChanged));
    properties.add(DoubleProperty('height', height));
    properties.add(DiagnosticsProperty<EdgeInsets?>('margin', margin));
    properties.add(DiagnosticsProperty<TextStyle?>('hintStyle', hintStyle));
    properties.add(DiagnosticsProperty<TextStyle?>('prefixStyle', prefixStyle));
    properties.add(StringProperty('prefixText', prefixText));
    properties.add(EnumProperty<TextCapitalization?>('textCapitalization', textCapitalization));
    properties.add(DiagnosticsProperty<bool>('autofocus', autofocus));
    properties.add(ColorProperty('background', background));
    properties.add(DiagnosticsProperty<bool>('readOnly', readOnly));
    properties.add(IntProperty('minLines', minLines));
    properties.add(ColorProperty('borderColor', borderColor));
    properties.add(DiagnosticsProperty('textInputAction', textInputAction));
  }
}
