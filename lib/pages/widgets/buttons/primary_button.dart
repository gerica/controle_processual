import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/ui_helper.dart';

enum PrimaryButtonColor { success, error, primary, secondary }

extension PrimaryButtonColorExtension on PrimaryButtonColor {
  Color get backgroundColor {
    switch (this) {
      case PrimaryButtonColor.success:
        return AppColorScheme.success.withOpacity(0.4);
      case PrimaryButtonColor.error:
        return AppColorScheme.error.withOpacity(0.4);
      case PrimaryButtonColor.primary:
        return AppColorScheme.primarySwatch;
      case PrimaryButtonColor.secondary:
        return AppColorScheme.blue;
    }
  }

  Color get textColor {
    switch (this) {
      case PrimaryButtonColor.success:
        return AppColorScheme.white;
      case PrimaryButtonColor.error:
        return AppColorScheme.white;
      case PrimaryButtonColor.primary:
        return AppColorScheme.primarySwatch;
      case PrimaryButtonColor.secondary:
        return AppColorScheme.blue;
    }
  }
}

enum PrimaryButtonType { circular, rounded }

extension PrimaryButtonTypeExtension on PrimaryButtonType {
  double get cornerRadius {
    switch (this) {
      case PrimaryButtonType.circular:
        return 100;
      case PrimaryButtonType.rounded:
        return 15;
    }
  }
}

enum PrimaryButtonStyle { filled, bordered, clear }

extension PrimaryButtonStyleExtension on PrimaryButtonStyle {
  bool get showBackground {
    switch (this) {
      case PrimaryButtonStyle.filled:
        return true;
      case PrimaryButtonStyle.bordered:
        return false;
      case PrimaryButtonStyle.clear:
        return false;
    }
  }

  bool get showBorder {
    switch (this) {
      case PrimaryButtonStyle.filled:
        return false;
      case PrimaryButtonStyle.bordered:
        return true;
      case PrimaryButtonStyle.clear:
        return false;
    }
  }
}

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final PrimaryButtonColor color;
  final PrimaryButtonType type;
  final PrimaryButtonStyle style;
  final Status state;
  double fontSize;
  double height;
  FontWeight fontWeight;
  Widget? icon;
  double width;

  PrimaryButton({
    required this.onPressed,
    required this.title,
    required this.color,
    required this.type,
    required this.style,
    required this.state,
    this.fontSize = 16,
    this.icon,
    this.fontWeight = FontWeight.normal,
    this.height = 50,
    this.width = double.infinity,
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
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Visibility(
              visible: state == Status.loading,
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    UIHelper.horizontalSpaceExtraTiny,
                  ],
                  Text(
                    title,
                    style: TextStyle(
                      color: style.showBorder ? color.textColor : AppColorScheme.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  ),
                ],
              ),
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColorScheme.primarySwatch),
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
    properties.add(ObjectFlagProperty<Function()>.has('onPressed', onPressed));
    properties.add(EnumProperty<PrimaryButtonColor>('color', color));
    properties.add(EnumProperty<PrimaryButtonType>('type', type));
    properties.add(EnumProperty<PrimaryButtonStyle>('style', style));
    properties.add(DoubleProperty('fontSize', fontSize));
    properties.add(DiagnosticsProperty<FontWeight>('fontWeight', fontWeight));
    properties.add(DiagnosticsProperty<Status>('state', state));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('width', width));
  }
}
