import 'package:get/get.dart';
import 'package:quizzical/controllers/question_controller.dart';

import 'categories_controller.dart';
import 'question_controller.dart';
import 'quiz_configure_controller.dart';
import 'single_question_controller.dart';
import 'welcome_controller.dart';

class ResultController {
  void playAgin() {  
    clearAllData();
    Get.offAllNamed('/');
  }

  void clearAllData() {
    Get.find<CategoriesController>().clearData();
    Get.find<QuestionController>().clearData();
    Get.find<QuizConfigController>().clearData();
    Get.find<SingleQuestionController>().clearData();
    Get.find<WelcomeController>().isLoading.value = false;
  }
}
