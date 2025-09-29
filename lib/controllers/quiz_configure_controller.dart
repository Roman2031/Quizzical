import 'package:get/get.dart';

class QuizConfigController extends GetxController {
  // Observables for state management
  final RxDouble _numberOfQuestions = 25.0.obs;
  final RxString _difficultyLevel = 'Any Difficulty'.obs;

  // Getters to access the values
  double get numberOfQuestions => _numberOfQuestions.value;
  String get difficultyLevel => _difficultyLevel.value;

  // Available difficulty levels for the dropdown
  final List<String> difficultyOptions = [
    'Any Difficulty',
    'Easy',
    'Medium',
    'Hard',
  ];

  // Actions to update the state
  void setNumberOfQuestions(double value) {
    _numberOfQuestions.value = value.roundToDouble();
  }

  void setDifficultyLevel(String? value) {
    if (value != null) {
      _difficultyLevel.value = value;
    }
  }

  void startQuiz() {
    // Logic to navigate to the quiz, passing the selected configuration
    print('Starting Quiz with:');
    print('Questions: ${_numberOfQuestions.value.toInt()}');
    print('Difficulty: ${_difficultyLevel.value}');
    // Example navigation:
    // Get.toNamed('/quiz_screen', arguments: {
    //   'count': _numberOfQuestions.value.toInt(),
    //   'difficulty': _difficultyLevel.value,
    // });
  }
}