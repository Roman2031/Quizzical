class QuestionModel {
  final String question;
  final List<String> incorrect_answers;
  final String correct_answer;

  QuestionModel({
    required this.question,
    required this.incorrect_answers,
    required this.correct_answer,
  });
}
