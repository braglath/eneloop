import 'dart:convert';
import 'dart:ui';

import 'package:energy/app/data/resources/assets/string_assets.dart';
import 'package:energy/app/data/resources/color_resources.dart';
import 'package:energy/app/data/resources/constant_resources.dart';
import 'package:energy/app/modules/home/controllers/home_controller.dart';
import 'package:energy/app/views/charts/line_chart.dart';
import 'package:energy/app/views/charts/pie_chart.dart';
import 'package:energy/app/views/charts/spark_bar_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:reorderableitemsview/reorderableitemsview.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController controller =
        Get.put<DashboardController>(DashboardController());

    List<Widget> graphGrid = [
      RepaintBoundary(
        key: controller.globalKey1,
        child: LongPressDraggable<Map<String, String>>(
            data: {'id': 'x'},
            feedback: Builder(
                builder: (_) => StreamBuilder(
                    initialData: null,
                    stream: controller.captureWidget(controller.globalKey1),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == null) return SHOW_NOTHING;
                        //? else
                        return Image.memory(snapshot.data!);
                      } else {
                        return SHOW_NOTHING;
                      }
                    }))),
            onDragStarted: () {
              controller.captureWidgetSub = controller
                  .captureWidget(controller.globalKey1)
                  .listen((event) {});
              controller.showDragCancelBtn.value = true;
            },
            onDragUpdate: (details) {
              if (controller.bottomSheetKey != null) {
                controller.bottomSheetKey!.close();
                controller.bottomSheetKey = null;
                controller.showFABCancelBtn.value = false;
              }
            },
            onDragEnd: (details) {
              controller.showDragCancelBtn.value = false;
            },
            onDragCompleted: () => controller.showDragCancelBtn.value = false,
            onDraggableCanceled: (velocity, offset) =>
                controller.showDragCancelBtn.value = false,
            child: Line(
              Key('x'),
              Colors.lightBlue,
              onPlusTap: () {},
              onMinusTap: () {},
            )),
      ),
      RepaintBoundary(
        key: controller.globalKey2,
        child: LongPressDraggable(
            data: {'id': 'y'},
            feedback: Builder(
                builder: (_) => StreamBuilder(
                    initialData: null,
                    stream: controller.captureWidget(controller.globalKey2),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == null) return SHOW_NOTHING;
                        //? else
                        return Image.memory(snapshot.data!);
                      } else {
                        return SHOW_NOTHING;
                      }
                    }))),
            onDragStarted: () {
              controller.captureWidgetSub = controller
                  .captureWidget(controller.globalKey2)
                  .listen((event) {});
              controller.showDragCancelBtn.value = true;
            },
            onDragUpdate: (details) {
              if (controller.bottomSheetKey != null) {
                controller.bottomSheetKey!.close();
                controller.bottomSheetKey = null;
                controller.showFABCancelBtn.value = false;
              }
            },
            onDragEnd: (details) {
              controller.showDragCancelBtn.value = false;
            },
            onDragCompleted: () => controller.showDragCancelBtn.value = false,
            onDraggableCanceled: (velocity, offset) =>
                controller.showDragCancelBtn.value = false,
            child: Pie(Key('y'), Colors.lightBlue)),
      ),
      RepaintBoundary(
        key: controller.globalKey3,
        child: LongPressDraggable(
            data: {'id': 'z'},
            feedback: Builder(
                builder: (_) => StreamBuilder(
                    initialData: null,
                    stream: controller.captureWidget(controller.globalKey3),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == null) return SHOW_NOTHING;
                        //? else
                        return Image.memory(snapshot.data!);
                      } else {
                        return SHOW_NOTHING;
                      }
                    }))),
            onDragStarted: () {
              controller.captureWidgetSub = controller
                  .captureWidget(controller.globalKey3)
                  .listen((event) {});
              controller.showDragCancelBtn.value = true;
            },
            onDragUpdate: (details) {
              if (controller.bottomSheetKey != null) {
                controller.bottomSheetKey!.close();
                controller.bottomSheetKey = null;
                controller.showFABCancelBtn.value = false;
              }
            },
            onDragEnd: (details) {
              controller.showDragCancelBtn.value = false;
            },
            onDragCompleted: () => controller.showDragCancelBtn.value = false,
            onDraggableCanceled: (velocity, offset) =>
                controller.showDragCancelBtn.value = false,
            child: SparkBar(Key('z'), Colors.lightBlue)),
      ),
    ];

    return Scaffold(
        key: controller.scaffoldKey,
        extendBody: true,
        appBar: AppBar(
          title: Text(
            'Dashboard',
          ),
          automaticallyImplyLeading: false,
          centerTitle: false,
          actions: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Obx(() => DropdownButton<String>(
                      style: h3_dark(context),
                      hint: Text(
                        'this is a hint',
                        style: h4_dark(context),
                      ),
                      value: controller.selectedEnergyType.value,
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                          child: Text('All'),
                          value: 'All',
                        ),
                        DropdownMenuItem(
                            child: new Text('Land Survey'), value: 'two'),
                        DropdownMenuItem(
                            child: new Text('Wind'), value: 'three'),
                        DropdownMenuItem(
                            child: new Text('Solar'), value: 'four'),
                      ],
                      onChanged: (value) {
                        print('selected drop down value - ');
                        if (value == null) return;
                        controller.selectedEnergyType.value = value;
                      },
                    )),
              ],
            )
          ],
        ),
        floatingActionButton: Column(
          mainAxisSize: MIN,
          mainAxisAlignment: MAIN_AXIS_END,
          children: [
            FloatingActionButton(
                onPressed: () async {
                  if (controller.bottomSheetKey != null) {
                    controller.bottomSheetKey!.close();
                    controller.bottomSheetKey = null;
                    controller.showFABCancelBtn.value = false;
                    return;
                  }
                  controller.showFABCancelBtn.value = true;

                  if (controller.isFirstTimeShowingModelSheet.isTrue) {
                    controller.showDragAnimation();
                  }

                  Get.put<HomeController>(HomeController())
                      .isBottomNavBarVisible
                      .value = false;
                  controller.bottomSheetKey =
                      controller.scaffoldKey.currentState!.showBottomSheet(
                          elevation: 12,
                          enableDrag: false,
                          (BuildContext context) => Obx(() => Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                    child: Container(
                                      height: DEVICE_HEIGHT / 2,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.white.withOpacity(0.8),
                                            Colors.white.withOpacity(0.5),
                                          ],
                                          begin: AlignmentDirectional.topStart,
                                          end: AlignmentDirectional.bottomEnd,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                      ),
                                      child: Column(
                                        children: [
                                          SPACING_VSMALL_HEIGHT,
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: APP_DARK_GREY
                                                    .withOpacity(0.5)),
                                            width: 35,
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: GridView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              padding: const EdgeInsets.all(8),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 4.0,
                                                      mainAxisSpacing: 4.0),
                                              itemCount: graphGrid.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                          int index) =>
                                                      graphGrid[index],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  controller.isFirstTimeShowingModelSheet.isTrue
                                      ? Lottie.asset(StringAsset.dragAnimation)
                                      : SHOW_NOTHING
                                ],
                              )));
                },
                child: Obx(
                  () => FaIcon(controller.showFABCancelBtn.isTrue
                      ? FontAwesomeIcons.close
                      : FontAwesomeIcons.plus),
                )),
            Obx(() => SizedBox(
                  child: controller.homeController.isBottomNavBarVisible.isTrue
                      ? SPACING_LARGE_HEIGHT
                      : SHOW_NOTHING,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Stack(
            children: [
              DragTarget<Map<String, String>>(
                  onMove: (details) => controller.showAcceptWidget.value = true,
                  onLeave: (data) => controller.showAcceptWidget.value = false,
                  onAccept: (data) {},
                  onAcceptWithDetails: (details) {
                    controller.listStaggeredTileExtended.insert(
                      0,
                      StaggeredTileExtended.count(4, 4),
                    );

                    if (details.data['id'] == 'x') {
                      final firstItem = Line(
                        Key('x'),
                        Colors.lightBlue,
                        onPlusTap: () {},
                        onMinusTap: () {},
                      );
                      controller.tiles.insert(0, firstItem);
                      graphGrid.remove(firstItem);
                    } else if (details.data['id'] == 'y') {
                      final secondItem = Pie(Key('y'), Colors.lightBlue);
                      controller.tiles.insert(0, secondItem);
                      graphGrid.remove(secondItem);
                    } else if (details.data['id'] == 'z') {
                      final thirdItem = SparkBar(Key('z'), Colors.lightBlue);
                      controller.tiles.insert(0, thirdItem);
                      graphGrid.remove(thirdItem);
                    }

                    controller.showAcceptWidget.value = false;
                  },
                  builder: (context, candidateData, rejectedData) => Stack(
                        children: [
                          ReorderableItemsView(
                            scrollController: controller.scrollController,
                            onReorder: (int oldIndex, int newIndex) {
                              controller.tiles.insert(newIndex,
                                  controller.tiles.removeAt(oldIndex));
                              // controller.updateDash();
                            },
                            crossAxisCount: 4,
                            isGrid: true,
                            staggeredTiles:
                                controller.listStaggeredTileExtended,
                            longPressToDrag: true,
                            children: controller.tiles,
                          ),
                          Obx(() => SizedBox(
                              child: controller.showAcceptWidget.isTrue
                                  ? Container(
                                      width: DEVICE_WIDTH,
                                      height: DEVICE_HEIGHT,
                                      color: APP_MAIN_BLUE.withOpacity(0.5),
                                    )
                                  : SHOW_NOTHING))
                        ],
                      )),
              CancelDraggedWidget(controller: controller),
            ],
          ),
        ));
  }
}

class CancelDraggedWidget extends StatelessWidget {
  const CancelDraggedWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) => Obx(
        () => controller.showDragCancelBtn.isTrue
            ? Positioned(
                bottom: 100,
                top: 500,
                right: 50,
                left: 50,
                // padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: DragTarget(
                  onMove: (details) =>
                      controller.showAcceptCancelWidget.value = true,
                  onLeave: (data) =>
                      controller.showAcceptCancelWidget.value = false,
                  onAccept: (data) {},
                  onWillAccept: (data) {
                    return true;
                  },
                  builder: (context, candidateData, rejectedData) => Center(
                    child: Container(
                      width: DEVICE_WIDTH / 1.5,
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: controller.showAcceptCancelWidget.isTrue
                              ? [
                                  RED.withOpacity(0.8),
                                  RED.withOpacity(0.5),
                                ]
                              : [
                                  Colors.white.withOpacity(0.8),
                                  Colors.white.withOpacity(0.5),
                                ],
                          begin: AlignmentDirectional.topStart,
                          end: AlignmentDirectional.bottomEnd,
                        ),
                        color: APP_DARK_GREY,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MIN,
                        mainAxisAlignment: MAIN_AXIS_CENTER,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.remove,
                            color: APP_DARK_GREY_OPACITY_5,
                          ),
                          SPACING_SMALL_WIDTH,
                          Text(
                            'Cancel',
                            style: h3_dark(context),
                          )
                        ],
                      ),
                    ),
                  ),
                )),
              )
            : SHOW_NOTHING,
      );
}
