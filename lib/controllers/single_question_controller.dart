import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/models/all_question__model.dart';

import '../models/result_model.dart';

class SingleQuestionController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxInt correct_answer = 0.obs;
  RxString nextButtonText = "Next".obs;
  RxnString selectedAnswer = RxnString();
  final Rx<bool> isAnswered = false.obs;
  final Rx<Color> selectedColor = Colors.white.obs;
  final Rx<Color> selectedIconBackgroundColor = Colors.white.obs;
  final Rxn<Icon> selectedIcon = Rxn<Icon>();
  final RxList<AllQuestionModel> questions = <AllQuestionModel>[].obs;

  void selectAnswer(String answer) {
    if (isAnswered.value) return; // Prevent changing answer once selected
    if (answer == questions[currentIndex.value].correctAnswer) {
      selectedColor.value = Color(0xFFD6EADF);
      selectedIcon.value = Icon(Icons.check, color: Colors.white, size: 14);
      selectedIconBackgroundColor.value = Colors.green.shade900;
      correct_answer.value++;
    } else {
      selectedColor.value = Colors.red.shade300;
      selectedIcon.value = Icon(Icons.close, color: Colors.white, size: 14);
      selectedIconBackgroundColor.value = Colors.red.shade900;
    }
    selectedAnswer.value = answer;
    isAnswered.value = true;
  }

  void nextQuestion() {
    if (nextButtonText.value == "Finish") {
      Get.toNamed(
        '/results_screen',
        arguments: ResultModel(correct_answer.value, questions.length
      ));
      return;
    }
    if (!isAnswered.value) {
      Get.snackbar(
        'No Answer Selected',
        'Please select an answer before proceeding to the next question.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
      );
      return;
    }
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = null;
      if (currentIndex.value != (questions.length - 1)) {
        nextButtonText.value = "Next";
      } else {
        nextButtonText.value = "Finish";
      }
    }
    isAnswered.value = false;
  }

    void clearData() {
    currentIndex.value = 0;
    correct_answer.value = 0;
    }
}
