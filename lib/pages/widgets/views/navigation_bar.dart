import 'package:flutter/material.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/app_images.dart';
import 'package:controle_processual/utils/app_routes.dart';
import 'package:controle_processual/utils/constants.dart';
import 'package:controle_processual/utils/ui_helper.dart';
import 'package:get/get.dart';

import 'app_version.dart';
import 'navigation_item.dart';

class NavigationBar extends StatefulWidget {
  int index = 0;

  NavigationBar({required this.index});

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorScheme.primarySwatch,
      height: 100.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: GestureDetector(
              onTap: () => Get.offAndToNamed(Routes.home),
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  AppImages.analise,
                  height: 90,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // Text("Home"),
                    // Text("Device"),
                    NavigationItem(
                      selected: widget.index == KHomeIndex,
                      title: 'Home',
                      routeName: Routes.home,
                      onHighlight: onHighlight,
                    ),
                    UIHelper.horizontalSpaceLarge,
                    NavigationItem(
                      selected: widget.index == KExamIndex,
                      title: 'Exams',
                      routeName: Routes.exams,
                      onHighlight: onHighlight,
                    ),
                    UIHelper.horizontalSpaceLarge,
                    NavigationItem(
                      selected: widget.index == KDataScienceIndex,
                      title: 'Data Science',
                      routeName: Routes.dataScience,
                      onHighlight: onHighlight,
                    ),
                    UIHelper.horizontalSpaceLarge,
                    NavigationItem(
                      selected: widget.index == KStatusIndex,
                      title: 'Status',
                      routeName: Routes.status,
                      onHighlight: onHighlight,
                    ),
                    UIHelper.horizontalSpaceLarge,
                    NavigationItem(
                      selected: widget.index == KLogoutIndex,
                      title: 'Logout',
                      routeName: Routes.sigin,
                      onHighlight: onHighlight,
                    ),
                  ],
                ),
                const AppVersion(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onHighlight(String route) {
    switch (route) {
      case 'routeHome':
        changeHighlight(0);
        break;
      case 'routeAbout':
        changeHighlight(1);
        break;
      case 'routeContacts':
        changeHighlight(2);
        break;
    }
  }

  void changeHighlight(int newIndex) {
    setState(() {
      widget.index = newIndex;
    });
  }
}
