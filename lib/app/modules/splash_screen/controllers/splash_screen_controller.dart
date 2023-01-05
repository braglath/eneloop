import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final showSecond = false.obs;
  Timer? _timer;
  int _start = 3;

  @override
  void onInit() async {
    super.onInit();
    await changeAnimation().whenComplete(() => startTimer());
  }

  Future<void> changeAnimation() async =>
      Timer(1650.milliseconds, () async => showSecond.value = true);

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          //! TODO: need to change below to off all or off and to named
          Get.toNamed(Routes.HOME);
        } else {
          _start--;
        }
      },
    );
  }

  @override
  void onClose() {
    if (_timer != null) _timer!.cancel();
    super.onClose();
  }
}
