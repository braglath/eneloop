import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/land_survey_controller.dart';

class LandSurveyView extends GetView<LandSurveyController> {
  const LandSurveyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LandSurveyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LandSurveyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
