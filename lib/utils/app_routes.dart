import 'package:controle_processual/pages/processo/binding/processo_binding.dart';
import 'package:controle_processual/pages/processo/page/processo_page.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/home/binding/home_binding.dart';
import 'package:controle_processual/pages/home/page/home_page.dart';

abstract class Routes {
  static const home = '/home';
  static const processo = '/processo';
}

mixin AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.processo,
      page: () => ProcessoPage(),
      binding: ProcessoBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
