// lib/bindings/quiz_binding.dart

import 'package:get/get.dart';
import '../controllers/single_question_controller.dart';

class SingleQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleQuestionController>(() => SingleQuestionController());
    Get.lazyPut<SingleQuestionController>(() => SingleQuestionController());
  }
}
