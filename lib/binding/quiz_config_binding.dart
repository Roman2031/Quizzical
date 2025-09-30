// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print

import 'package:get/get.dart';

import '../controllers/quiz_configure_controller.dart';

class QuizConfigBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizConfigController>(() => QuizConfigController());
  }
}
