import 'package:energy/app/data/resources/constant_resources.dart';
import 'package:energy/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/resources/color_resources.dart';
import '../views/bottom_navigation.dart';

class HomeController extends GetxController {
  late ScrollController scrollController;
  late PageController pageController;

  final isBottomNavBarVisible = true.obs;
  final isAppBarVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    pageController = PageController();
    scrollController.addListener(scrollControllerListener);
    pageController.addListener(() {
      if (pageController.hasClients) {
        update(['bottom nav icons']);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    if (pageController.hasClients) {
      update(['bottom nav icons']);
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollControllerListener);
    scrollController.dispose();
    super.onClose();
  }

  void scrollControllerListener() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      isBottomNavBarVisible.value = true;
      isAppBarVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      isBottomNavBarVisible.value = false;
      isAppBarVisible.value = false;
    }
    print('showing app bar - ${isAppBarVisible.value}');
  }

  List<Widget> getTabsData() {
    return [
      SPACER,
      IconsBNB(
          icon: Icon(
            Icons.home,
            color: pageController.hasClients && pageController.page == 0
                ? APP_MAIN_BLUE
                : APP_DARK_GREY,
            size:
                pageController.hasClients && pageController.page == 0 ? 30 : 22,
          ),
          title: 'Home',
          onIconTap: () {
            pageController.animateToPage(0,
                duration: 200.milliseconds, curve: Curves.fastOutSlowIn);
          }),
      SPACER,
      IconsBNB(
          icon: FaIcon(
            FontAwesomeIcons.objectGroup,
            color: pageController.hasClients && pageController.page == 1
                ? APP_MAIN_BLUE
                : APP_DARK_GREY,
            size:
                pageController.hasClients && pageController.page == 1 ? 30 : 22,
          ),
          title: 'History',
          onIconTap: () {
            pageController.animateToPage(1,
                duration: 200.milliseconds, curve: Curves.fastOutSlowIn);
          }),
      SPACER,
      IconsBNB(
          icon: Icon(
            Icons.search,
            color: pageController.hasClients && pageController.page == 2
                ? APP_MAIN_BLUE
                : APP_DARK_GREY,
            size:
                pageController.hasClients && pageController.page == 2 ? 30 : 22,
          ),
          title: 'Search',
          onIconTap: () {
            pageController.animateToPage(2,
                duration: 200.milliseconds, curve: Curves.fastOutSlowIn);
          }),
      SPACER,
      IconsBNB(
          icon: FaIcon(
            FontAwesomeIcons.person,
            color: pageController.hasClients && pageController.page == 3
                ? APP_MAIN_BLUE
                : APP_DARK_GREY,
            size:
                pageController.hasClients && pageController.page == 3 ? 30 : 22,
          ),
          title: 'Alarm',
          onIconTap: () {
            pageController.animateToPage(3,
                duration: 200.milliseconds, curve: Curves.fastOutSlowIn);
          }),
      SPACER,
    ];
  }
}
