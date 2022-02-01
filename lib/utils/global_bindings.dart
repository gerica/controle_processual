import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put(UsuarioController(), permanent: true);
    // Get.put(ConferenciaController(), permanent: true);
    // Get.put(LoginController(), permanent: true);
  }
}

// TestCartController? cartController;
//
// if(condition){
// cartController = Get.isRegistered<TestCartController>()
// ? Get.find<TestCartController>()
//     : Get.put(TestCartController());
//
// }
