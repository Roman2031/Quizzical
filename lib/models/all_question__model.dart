class AllQuestionModel {
  final String? type;
  final String? difficulty;
  final String? category;
  final String? question;
  final String? correctAnswer;
  final List<String> answers;

  AllQuestionModel({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    required this.answers,
  });

  factory AllQuestionModel.fromJson(Map<String, dynamic> json) {
    return AllQuestionModel(
      type: json['type'] as String?,
      difficulty: json['difficulty'] as String?,
      category: json['category'] as String?,
      question: json['question'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      answers: List<String>.from(json['incorrect_answers'] ?? []),
    );
  }

  Map<String, dynamic> toMap() => {
    "type": type,
    "difficulty": difficulty,
    "category": category,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": answers,
  };

  @override
  String toString() {
    return 'QuestionModel(type: $type, difficulty: $difficulty, category: $category, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $answers)';
  }
}
