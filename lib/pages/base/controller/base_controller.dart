import 'package:controle_processual/domain/base/app_exception.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/widgets/views/simple_dialog.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';

abstract class BaseController extends GetxController {
  final loading = false.obs;

  void init() {
    loading(false);
  }

  void handleError(AppException error) {
    Get.dialog(
      AppSimpleDialog(
        title: error.title ?? '',
        message: error.description ?? '',
        icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
        onClosePressed: () {
          Get.back();
        },
      ),
    );
  }

  snackBarError({String? title, required String msg}) {
    if (title == null) {
      title = "Erro";
    }
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      backgroundColor: LocalThemeColors.error,
      duration: Duration(seconds: 15),
    );
  }

  snackBar({String? title, required String msg}) {
    title ??= "Informação";
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
      backgroundColor: LocalThemeColors.success,
      maxWidth: 300,
      // forwardAnimationCurve: Curves.easeIn,
      // reverseAnimationCurve: Curves.easeOut,
    );
  }

  snackBarWarning({String? title, required String msg}) {
    if (title == null) {
      title = "Warning";
    }
    Get.snackbar(
      title,
      msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
      margin: const EdgeInsets.all(16),
      backgroundColor: LocalThemeColors.yellow,
      duration: Duration(seconds: 5),
    );
  }
}
