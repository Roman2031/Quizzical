import 'package:get/get.dart';
import 'package:quizzical/controllers/question_controller.dart';

class QuizConfigController extends GetxController {
  // Observables for state management
  final RxDouble _numberOfQuestions = 25.0.obs;
  final RxString _difficultyLevel = 'Easy'.obs;
  RxBool isLoading = false.obs;
  // Getters to access the values
  double get numberOfQuestions => _numberOfQuestions.value;
  String get difficultyLevel => _difficultyLevel.value;

  // Available difficulty levels for the dropdown
  final List<String> difficultyOptions = ['Easy', 'Medium', 'Hard'];

  // Actions to update the state
  void setNumberOfQuestions(double value) {
    _numberOfQuestions.value = value.roundToDouble();
  }

  void setDifficultyLevel(String? value) {
    if (value != null) {
      _difficultyLevel.value = value;
    }
  }

  void startQuiz() async {
    try {
      isLoading.value = true;
      final QuestionController questionController = Get.put(
        QuestionController(),
      );
    await questionController.getQuestionList(
        amount: _numberOfQuestions.value.toInt(),
        category:
            Get.arguments ?? 0, // Assuming category ID is passed as an argument
        difficulty: _difficultyLevel.value.toLowerCase() == 'easy'
            ? ''
            : _difficultyLevel.value.toLowerCase(),
        type: 'multiple', // Assuming multiple choice questions
      );
      // Logic to navigate to the quiz, passing the selected configuration
      print('Starting Quiz with:');
      print('Questions: ${_numberOfQuestions.value.toInt()}');
      print('Difficulty: ${_difficultyLevel.value}');
      // Example navigation:
      // Get.toNamed('/quiz_screen', arguments: {
      //   'count': _numberOfQuestions.value.toInt(),
      //   'difficulty': _difficultyLevel.value,
      // });
      isLoading.value = false;
    } catch (e) {
      print('Error starting quiz: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
