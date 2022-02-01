import 'package:controle_processual/pages/processo/controller/processo_controller.dart';
import 'package:get/get.dart';

class ProcessoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProcessoController());
  }
}
