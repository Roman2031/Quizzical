import 'package:get/get.dart';
import 'package:quizzical/models/all_question__model.dart';
import '../models/question_model.dart';

class SingleQuestionController extends GetxController {  
  var currentIndex = 0.obs;
  var selectedAnswer = RxnString(); 
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
    selectedAnswer.value = answer;
  }

  void nextQuestion() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
      selectedAnswer.value = null;
    }
  }
}
