import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/routes/app_pages.dart';
import 'package:pasar_petani/config/constants.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(initState: (_) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        Get.offNamed(Routes.LOGIN);
        timer.cancel();
      });
    }, builder: (
      context,
    ) {
      return Scaffold(
        body: Center(
          child: logo,
        ),
      );
    });
  }
}
