import 'dart:convert';

import 'package:controle_processual/domain/model/checkbox_model.dart';
import 'package:controle_processual/pages/base/controller/base_controller.dart';
import 'package:controle_processual/pages/widgets/views/simple_dialog.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomColumnsController extends BaseController {
  static CustomColumnsController get to => Get.isRegistered<CustomColumnsController>()
      ? Get.find<CustomColumnsController>()
      : Get.put(CustomColumnsController());
  final columns = [].obs;
  final checkAll = true.obs;
  String nameLocalStorage = "";

  @override
  void onReady() {
    super.onReady();
    fetchExamsColumns();
    final anyoneCheck = columns.value.any((element) => element.checked);
    checkAll(anyoneCheck);
    columns.clear();
  }

  Future<void> fetchExamsColumns() async {
    String? columnsStr = await LocalStorage().get(nameLocalStorage);
    if (columnsStr != null && columnsStr.isNotEmpty) {
      List<dynamic> valueStrMap = jsonDecode(columnsStr) as List<dynamic>;
      if (valueStrMap.isNotEmpty) {
        valueStrMap.forEach((v) => columns.add(CheckBoxModel.fromJson(v)));
      }
    }
  }

  void changeCheck(CheckBoxModel item) {
    var itemSelected = columns.firstWhere((check) => check.text == item.text);
    itemSelected.checked = !itemSelected.checked;
    columns.refresh();
  }

  void confirm() {
    final anyoneCheck = columns.value.any((element) => element.checked);
    if (!anyoneCheck) {
      Get.dialog(
        AppSimpleDialog(
          title: 'Warning',
          message: 'Select one column',
          icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.yellow),
          onClosePressed: () {
            Get.back();
          },
        ),
      );
    } else {
      String columnsJson = jsonEncode(columns.value);
      LocalStorage().save(nameLocalStorage, columnsJson);
      Get.back();
    }
  }

  void toggleCheckAll(bool? value) {
    checkAll(value);
    columns.value.forEach((element) => element.checked = value);
  }
}
