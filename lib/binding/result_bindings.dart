// lib/bindings/quiz_binding.dart

import 'package:get/get.dart';

import '../controllers/result_controller.dart';

class ResultBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
  }
}
