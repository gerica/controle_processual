import 'dart:io';

import 'package:controle_processual/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controle_processual/pages/splash/page/splash_page.dart';
import 'package:controle_processual/utils/app_routes.dart';
import 'package:controle_processual/utils/app_theme_data.dart';
import 'package:controle_processual/utils/global_bindings.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
    initialBinding: GlobalBindings(),
    title: 'Radiolife',
    theme: AppThemeData.themeDataLight,
    darkTheme: AppThemeData.themeDataLight,
    home: SplashPage(),
    getPages: AppRoutes.routes,
    // initialRoute: Routes.signUp,
  ));
}
