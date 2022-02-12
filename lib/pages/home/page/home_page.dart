import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:controle_processual/pages/base/page/base_page.dart';
import 'package:controle_processual/pages/home/controller/home_controller.dart';
import 'package:controle_processual/pages/widgets/views/navigation_bar.dart' as localNav;
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:controle_processual/utils/constants.dart';

class HomePage extends GetView<HomeController> with BasePage {
  @override
  Widget build(BuildContext context) {
    controller.size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            localNav.NavigationBar(index: KHomeIndex),
            Expanded(child: _buildBody()),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      // width: 100,
      // height: 100,
      color: AppColorScheme.background,
      child: const Center(
        child: SelectableText("Controle processual"),
      ),
    );
  }
}
