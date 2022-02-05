import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PrimaryButtonIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final PrimaryButtonColor color;
  final PrimaryButtonType type;
  final PrimaryButtonStyle style;
  double height;
  Widget icon;
  double width;

  PrimaryButtonIcon({
    required this.onPressed,
    required this.color,
    required this.type,
    required this.style,
    required this.icon,
    this.height = 30,
    this.width = 30,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        child: RawMaterialButton(
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          highlightElevation: 0,
          fillColor: style.showBackground ? color.backgroundColor : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(type.cornerRadius),
              side: style.showBorder ? BorderSide(color: color.backgroundColor, width: 2) : BorderSide.none),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            child: icon,
          ),
        ),
      );
}
