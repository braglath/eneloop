import 'dart:async';
import 'dart:typed_data';

import 'package:energy/app/modules/dashboard/views/dashboard_view.dart';
import 'package:energy/app/views/charts/funnel_chart.dart';
import 'package:energy/app/views/charts/line_chart.dart';
import 'package:energy/app/views/charts/pyramid_chart.dart';
import 'package:energy/app/views/charts/spark_area_chart.dart';
import 'package:energy/app/views/charts/spark_bar_chart.dart';
import 'package:energy/app/views/charts/spark_line_chart.dart';
import 'package:energy/app/views/charts/spark_winloss_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:reorderableitemsview/reorderableitemsview.dart';
import 'dart:ui' as ui;
import '../../../views/charts/pie_chart.dart';
import '../../home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  late ScrollController scrollController;

  final GlobalKey globalKey1 = GlobalKey();
  final GlobalKey globalKey2 = GlobalKey();
  final GlobalKey globalKey3 = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? bottomSheetKey;

  final HomeController homeController =
      Get.put<HomeController>(HomeController());

  StreamSubscription? captureWidgetSub;

  List<StaggeredTileExtended> listStaggeredTileExtended = [];
  List<Widget> tiles = <Widget>[];

  final showDragCancelBtn = false.obs;
  final showFABCancelBtn = false.obs;

  final showAcceptWidget = false.obs;
  final showAcceptCancelWidget = false.obs;

  final selectedEnergyType = 'All'.obs;

  final isFirstTimeShowingModelSheet = true.obs;
  Timer? _timer;
  int _start = 3;

  @override
  void onInit() async {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(scrollControllerListener);
    addGraphs();
    addGraphSize();
  }

  void addGraphs() {
    tiles = <Widget>[
      Line(
        Key("a"),
        Colors.grey,
        showPlus: true,
        absorbPointer: false,
        onPlusTap: () => onPlusTap(Key('a')),
        onMinusTap: () => onMinusTap(Key('a')),
      ),
      Pie(
        Key("b"),
        Colors.lightBlue,
        needTitle: true,
        colors: [Colors.orange, Colors.redAccent, Colors.greenAccent],
      ),
      Pyramid(Key("c"), Colors.amber),
      Pie(Key("d"), Colors.brown),
      Funnel(Key("e"), Colors.deepOrange),
      SparkArea(Key("f"), Colors.pink),
      SparkBar(Key("g"), Colors.red),
      SparkWinLoss(Key("h"), Colors.purple),
      SparkLine(Key("i"), Colors.indigo),
    ];
  }

  void addGraphSize() {
    listStaggeredTileExtended = <StaggeredTileExtended>[
      StaggeredTileExtended.count(4, 4),
      StaggeredTileExtended.count(2, 2),
      StaggeredTileExtended.count(1, 2),
      StaggeredTileExtended.count(1, 1),
      StaggeredTileExtended.count(1, 1),
      StaggeredTileExtended.count(4, 1),
      StaggeredTileExtended.count(2, 2),
      StaggeredTileExtended.count(2, 2),
      StaggeredTileExtended.count(4, 1),
    ];
  }

  void showDragAnimation() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          //! TODO: need to change below to off all or off and to named
          isFirstTimeShowingModelSheet.value = false;
        } else {
          _start--;
        }
      },
    );
  }

  void onPlusTap(Key? key) {
    // find the index of current widget
    // use the index and find the size from size list
    // increase the size ratio from size list
    final itemIndex = tiles.indexWhere((element) => element.key == key);
    final currentCrossAxisSize =
        listStaggeredTileExtended[itemIndex].crossAxisCellCount;

    if (currentCrossAxisSize == 1) {
      //? show plus button
      //? increase size to 2,2
      listStaggeredTileExtended[itemIndex] = StaggeredTileExtended.count(2, 2);
    } else if (currentCrossAxisSize == 2) {
      //? show plus button
      //? increase size to 3,3
      listStaggeredTileExtended[itemIndex] = StaggeredTileExtended.count(3, 3);
    } else if (currentCrossAxisSize == 3) {
      //? increase size to 3,3
      listStaggeredTileExtended[itemIndex] = StaggeredTileExtended.count(4, 4);
    } else if (currentCrossAxisSize == 4) {
      //? reached max size do nothing
    }
  }

  void onMinusTap(Key? key) {
    // find the index of current widget
    // use the index and find the size from size list
    // increase the size ratio from size list
    final itemIndex = tiles.indexWhere((element) => element.key == key);
    final currentCrossAxisSize =
        listStaggeredTileExtended[itemIndex].crossAxisCellCount;

    if (currentCrossAxisSize == 1) {
      //? do not do anything, reached min size
    } else if (currentCrossAxisSize == 2) {
      //? do nothing, going below 2,2 graph not fitting
    } else if (currentCrossAxisSize == 3) {
      //? decrease size to 2,2
      listStaggeredTileExtended[itemIndex] = StaggeredTileExtended.count(2, 2);
    } else if (currentCrossAxisSize == 4) {
      //? decrease size to 3,3
      listStaggeredTileExtended[itemIndex] = StaggeredTileExtended.count(3, 3);
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.removeListener(scrollControllerListener);
    captureWidgetSub!.cancel();
    if (_timer != null) _timer!.cancel();
    super.onClose();
  }

  void scrollControllerListener() {
    final direction = scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      homeController.isBottomNavBarVisible.value = true;
    } else if (direction == ScrollDirection.reverse) {
      homeController.isBottomNavBarVisible.value = false;
    }
  }

  void updateDash() => update(['dash']);

  Stream<Uint8List?> captureWidget(GlobalKey globalKey) async* {
    if (globalKey.currentContext == null) yield null;
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    yield pngBytes;
  }
}
