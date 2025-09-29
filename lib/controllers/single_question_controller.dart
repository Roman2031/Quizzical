import 'package:get/get.dart';
import '../models/question_model.dart';

class SingleQuestionController extends GetxController {
  final questions = <QuestionModel>[
    QuestionModel(
      question: "In what year did the United States host the FIFA World Cup for the first time?",
      incorrect_answers: ["1986", "1994", "2000", "2007"],
      correct_answer: "1994",
    ),
    // Add more questions
  ].obs;

  var currentIndex = 0.obs;
  var selectedAnswer = RxnString(); // Nullable

  void selectAnswer(String answer) {
    selectedAnswer.value = answer;
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex++;
      selectedAnswer.value = null;
    }
  }
}
