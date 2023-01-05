import 'package:get/get.dart';

import '../controllers/land_survey_controller.dart';

class LandSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandSurveyController>(
      () => LandSurveyController(),
    );
  }
}
