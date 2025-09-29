// lib/bindings/quiz_binding.dart

import 'package:get/get.dart';

import '../controllers/quiz_configure_controller.dart';

class QuizConfigBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizConfigController>(() => QuizConfigController());
  }
}
