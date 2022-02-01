import 'package:controle_processual/utils/app_spacing.dart';
import 'package:flutter/material.dart';

class UIHelper {
  UIHelper._();

  static const Widget verticalSpaceExtraMini = SizedBox(height: AppSpacing.extraMini);
  static const Widget verticalSpaceMini = SizedBox(height: AppSpacing.mini);
  static const Widget verticalSpaceExtraTiny = SizedBox(height: AppSpacing.extraTiny);
  static const Widget verticalSpaceTiny = SizedBox(height: AppSpacing.tiny);
  static const Widget verticalSpaceExtraSmall = SizedBox(height: AppSpacing.extraSmall);
  static const Widget verticalSpaceSmall = SizedBox(height: AppSpacing.small);
  static const Widget spaceSmall = SizedBox(height: AppSpacing.small);
  static const Widget verticalSpaceExtraMedium = SizedBox(height: AppSpacing.extraMedium);
  static const Widget verticalSpaceMedium = SizedBox(height: AppSpacing.medium);
  static const Widget verticalSpaceLarge = SizedBox(height: AppSpacing.large);
  static const Widget verticalSpaceExtraLarge = SizedBox(height: AppSpacing.extraLarge);
  static const Widget verticalSpaceMega = SizedBox(height: AppSpacing.mega);
  static const Widget verticalSpaceUltra = SizedBox(height: AppSpacing.ultra);

  static const Widget horizontalSpaceExtraTiny = SizedBox(width: AppSpacing.extraTiny);
  static const Widget horizontalSpaceSmall = SizedBox(width: AppSpacing.small);
  static const Widget horizontalSpaceMedium = SizedBox(width: AppSpacing.medium);
  static const Widget horizontalSpaceLarge = SizedBox(width: AppSpacing.large);
  static const Widget horizontalSpaceMega = SizedBox(width: AppSpacing.mega);
  static const Widget dividerDefault = Divider(height: 10, thickness: 1, indent: 5, endIndent: 5);
}
