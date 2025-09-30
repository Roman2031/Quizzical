// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print

import 'package:get/get.dart';

import '../controllers/result_controller.dart';

class ResultBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultController>(() => ResultController());
  }
}
