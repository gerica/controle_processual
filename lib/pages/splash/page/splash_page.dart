import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:controle_processual/utils/app_images.dart';
import 'package:controle_processual/utils/app_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: Duration(seconds: 2), upperBound: 250.0, vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);

    _controller.forward();
    _animation.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        // var token = await LocalStorage().getFuture(KSessionToken);
        // if (token == null) {
        //   Future<void>.delayed(Duration(milliseconds: 1000), () => Get.offAndToNamed(Routes.sigin));
        // } else {
        //   // Future<void>.delayed(Duration(milliseconds: 1000), () => Get.offAndToNamed(Routes.exams));
        // }
        Future<void>.delayed(Duration(milliseconds: 1000), () => Get.offAndToNamed(Routes.home));
      }
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        child: Image.asset(
                          AppImages.logoVerticalColor,
                          fit: BoxFit.contain,
                        ),
                        height: _controller.value, // essa linha adiciona a animacao
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
