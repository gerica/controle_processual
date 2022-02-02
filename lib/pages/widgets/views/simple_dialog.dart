import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controle_processual/domain/enum/status.dart';
import 'package:controle_processual/pages/widgets/buttons/primary_button.dart';
import 'package:controle_processual/utils/app_border_radius.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_font_size.dart';
import 'package:controle_processual/utils/app_font_weight.dart';
import 'package:controle_processual/utils/app_spacing.dart';
import 'package:controle_processual/utils/ui_helper.dart';

class AppSimpleDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onClosePressed;
  final VoidCallback? onOkPressed;
  final Widget? icon;

  const AppSimpleDialog({
    required this.title,
    required this.message,
    this.onClosePressed,
    this.onOkPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          // width: 300,
          margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
          padding: const EdgeInsets.all(AppSpacing.medium),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            color: AppColorScheme.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black, fontSize: AppFontSize.medium, fontWeight: AppFontWeight.bold),
                  ),
                  if (onClosePressed != null)
                    IconButton(
                      onPressed: () {
                        Get.back();
                        onClosePressed!();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  else
                    Container()
                ],
              ),
              Container(
                height: 0.5,
                color: AppColorScheme.gray1,
                width: MediaQuery.of(context).size.width,
              ),
              UIHelper.verticalSpaceSmall,
              if (icon != null) ...[
                icon!,
                UIHelper.verticalSpaceSmall,
              ],
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: AppFontSize.primary),
              ),
              UIHelper.verticalSpaceMedium,
              if (onOkPressed != null)
                PrimaryButton(
                    onPressed: () {
                      Get.back();
                      onOkPressed!();
                    },
                    title: "Ok",
                    color: PrimaryButtonColor.primary,
                    type: PrimaryButtonType.circular,
                    style: PrimaryButtonStyle.filled,
                    state: Status.success)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<VoidCallback>.has('onCancel', onClosePressed));
    properties.add(StringProperty('title', title));
    properties.add(StringProperty('message', message));
    properties.add(DiagnosticsProperty<Widget?>('icon', icon));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onOkPressed', onOkPressed));
  }
}
