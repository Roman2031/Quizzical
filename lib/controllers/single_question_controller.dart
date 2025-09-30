import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/models/all_question__model.dart';
import '../models/question_model.dart';

class SingleQuestionController extends GetxController {
  var currentIndex = 0.obs;
  var nextButtonText = "Next".obs;
  var selectedAnswer = RxnString();
  final Rx<Color> selectedColor = Colors.white.obs;
  final Rx<Color> selectedIconBackgroundColor = Colors.white.obs;
  final Rxn<Icon> selectedIcon = Rxn<Icon>();
  // Use RxList for observable lists
  final RxList<AllQuestionModel> questions = <AllQuestionModel>[].obs;
  // final questions = <QuestionModel>[
  //   QuestionModel(
  //     question: "In what year did the United States host the FIFA World Cup for the first time?",
  //     incorrect_answers: ["1986", "1994", "2000", "2007"],
  //     correct_answer: "1994",
  //   ),
  //   // Add more questions
  // ].obs;

  void selectAnswer(String answer) {
    if (answer == questions[currentIndex.value].correctAnswer) {
      selectedColor.value = Color(0xFFD6EADF);
      selectedIcon.value = Icon(Icons.check, color: Colors.white, size: 14);
      selectedIconBackgroundColor.value = Colors.green.shade900;
    } else {
      selectedColor.value = Colors.red.shade300;
      selectedIcon.value = Icon(Icons.close, color: Colors.white, size: 14);
      selectedIconBackgroundColor.value = Colors.red.shade900;
    }
    selectedAnswer.value = answer;
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = null;
      currentIndex.value != (questions.length - 1)
          ? nextButtonText.value = "Next"
          : nextButtonText.value = "Finish";
    }
  }
}
