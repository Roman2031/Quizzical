// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print

import 'package:get/get.dart';
import '../controllers/single_question_controller.dart';

class SingleQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleQuestionController>(() => SingleQuestionController());
    Get.lazyPut<SingleQuestionController>(() => SingleQuestionController());
  }
}
