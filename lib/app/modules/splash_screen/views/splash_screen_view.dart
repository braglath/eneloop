import 'package:energy/app/data/resources/assets/string_assets.dart';
import 'package:energy/app/data/resources/color_resources.dart';
import 'package:energy/app/data/resources/constant_resources.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: DEVICE_WIDTH,
      height: DEVICE_HEIGHT,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [APP_MID_GREEN, WHITE],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Column(children: [
        SPACER,
        Obx(() => AnimatedCrossFade(
              sizeCurve: Curves.easeInCirc,
              secondCurve: Curves.easeInCirc,
              alignment: Alignment.center,
              duration: 600.milliseconds,
              crossFadeState: controller.showSecond.isTrue
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Lottie.asset(StringAsset.splashInfinity,
                  width: DEVICE_WIDTH / 1.5, height: 100),
              secondChild: Image.asset(StringAsset.logo),
            )),
        SPACER,
        Text(
          'powered by W2S Solutions',
          style: caption(context),
        ),
        SPACING_SMALL_HEIGHT,
      ]),
    );
  }
}
