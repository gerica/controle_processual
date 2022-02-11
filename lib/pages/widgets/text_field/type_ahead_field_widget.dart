import 'package:controle_processual/domain/model/cidade.dart';
import 'package:controle_processual/pages/widgets/text_field/input_decorations.dart';
import 'package:controle_processual/utils/mensagens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class TypeAheadFieldWidget extends StatelessWidget {
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
  double? width;
  final String? errorText;
  final bool isExpanded;
  final TextEditingController controller;

  TypeAheadFieldWidget({
    required this.controller,
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
    this.width,
    this.errorText,
    this.isExpanded = true,
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

  TypeAheadFormField<Cidade?> buildTextFieldCore(BuildContext context) {
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
    return TypeAheadFormField<Cidade?>(
      textFieldConfiguration: TextFieldConfiguration(
          controller: controller,
          // style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
          decoration: decoration.buildInputDecoration()),
      suggestionsCallback: (pattern) async {
        return CidadeDados.getCidades().where((cidade) {
          final nameLower = cidade.nome.toLowerCase();
          final queryLower = pattern.toLowerCase();
          return nameLower.contains(queryLower);
        });
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion!.nome),
        );
      },
      onSuggestionSelected: (suggestion) {
        controller.text = suggestion!.nome;
      },
      noItemsFoundBuilder: (context) => Container(
        height: 40,
        padding: const EdgeInsets.all(8),
        child: Text(
          Mensagens.instance.nenhumItemEncontrado,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
    );
  }
}
