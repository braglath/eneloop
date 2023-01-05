import 'package:energy/app/data/resources/color_resources.dart';
import 'package:energy/app/data/resources/constant_resources.dart';
import 'package:energy/app/modules/dashboard/views/dashboard_view.dart';
import 'package:energy/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import '../controllers/home_controller.dart';

class BottomNavigation extends GetView<HomeController> {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomSheet: BottomNavBar(controller: controller),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: PageView(
            controller: controller.pageController,
            physics: const BouncingScrollPhysics(),
            children: [
              const HomeView(),
              const DashboardView(),
              Container(
                  color: Colors.green,
                  width: DEVICE_WIDTH,
                  height: DEVICE_HEIGHT),
              Container(
                  color: Colors.yellow,
                  width: DEVICE_WIDTH,
                  height: DEVICE_HEIGHT),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ScrollToHideWidget(
      duration: 300.milliseconds,
      barHeight: kBottomNavigationBarHeight + 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GlassmorphicContainer(
          width: DEVICE_HEIGHT,
          height: kBottomNavigationBarHeight,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                APP_LIGHT_GREEN.withOpacity(0.1),
                APP_DARK_GREEN.withOpacity(0.3),
              ],
              stops: [
                0.1,
                1
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              APP_LIGHT_GREEN.withOpacity(0.1),
              APP_DARK_GREEN.withOpacity(0.1)
            ],
          ),
          child: GetBuilder(
              id: 'bottom nav icons',
              builder: (HomeController controller) {
                return Row(
                  mainAxisSize: MIN,
                  crossAxisAlignment: CROSS_AXIS_CENTER,
                  children: controller.getTabsData(),
                );
              }),
        ),
      ),
    );
  }
}

class IconsBNB extends GetView<HomeController> {
  final String title;
  final dynamic icon;
  final Function()? onIconTap;
  const IconsBNB({
    super.key,
    required this.title,
    required this.icon,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MIN,
        children: [
          SPACER,
          IconButton(
            onPressed: onIconTap,
            icon: icon,
            iconSize: 25,
            splashRadius: 1,
            splashColor: TRANSPARENT,
          ),
          SPACER
          // SPACING_VVSMALL_HEIGHT,
          // Text(
          //   title,
          //   style: h4_dark(context)
          //       ?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          // ),
        ],
      );
}

class ScrollToHideWidget extends GetView<HomeController> {
  final Widget child;
  final Duration duration;
  final double barHeight;
  const ScrollToHideWidget(
      {super.key,
      required this.child,
      required this.barHeight,
      required this.duration});

  @override
  Widget build(BuildContext context) => Obx(() => AnimatedContainer(
        duration: duration,
        height: controller.isBottomNavBarVisible.isTrue ? barHeight : 0,
        child: Wrap(
          children: [child],
        ),
      ));
}
