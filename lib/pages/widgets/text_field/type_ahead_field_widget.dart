import 'package:controle_processual/domain/model/option.dart';
import 'package:controle_processual/pages/widgets/text_field/input_decorations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TypeAheadFieldWidget extends StatelessWidget {
  final FocusNode? focusNode;
  final Color? background;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? prefixText;
  final Widget? prefixIcon;
  final TextStyle? prefixStyle;
  final Color? borderColor;
  final double height;
  double? width;
  final String? errorText;
  final TextEditingController controller;
  final Function(String) optionList;

  TypeAheadFieldWidget({
    required this.controller,
    required this.optionList,
    this.focusNode,
    this.background,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.prefixText,
    this.prefixIcon,
    this.prefixStyle,
    this.borderColor,
    this.height = 40,
    this.width,
    this.errorText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.width = MediaQuery.of(context).size.width * 0.22;
    return Container(
      height: height,
      width: width,
      child: buildTextFieldCore(context),
    );
  }

  Widget buildTextFieldCore(BuildContext context) {
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

    return Autocomplete<Option>(
      initialValue: TextEditingValue(text: controller.text),
      displayStringForOption: (value) => value.label,
      optionsBuilder: (TextEditingValue pattern) {
        if (pattern.text == '') {
          return const Iterable<Option>.empty();
        }

        return optionList(pattern.text);
      },
      onSelected: (Option selection) {
        controller.text = selection.value;
      },
      fieldViewBuilder: (context, fieldTextEditingController, fieldFocusNode, onFieldSubmitted) {
        fieldTextEditingController.text = controller.text;

        return TextFormField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          onEditingComplete: onFieldSubmitted,
          decoration: decoration.buildInputDecoration(),
        );
      },
    );
  }
}
