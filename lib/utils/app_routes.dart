import 'package:get/get.dart';
import 'package:controle_processual/pages/home/binding/home_binding.dart';
import 'package:controle_processual/pages/home/page/home_page.dart';

abstract class Routes {
  static const home = '/home';
  static const sigin = '/sigin';
  static const exams = '/exams';
  static const status = '/status';
  static const dataScience = '/dataScience';
}

mixin AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
