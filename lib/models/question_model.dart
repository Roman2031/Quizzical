class QuestionModel {
  final String? type;
  final String? difficulty;
  final String? category;
  final String? question;
  final String? correctAnswer;
  final List<String> incorrectAnswers;

  QuestionModel({
    this.type,
    this.difficulty,
    this.category,
    this.question,
    this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      type: json['type'] as String?,
      difficulty: json['difficulty'] as String?,
      category: json['category'] as String?,
      question: json['question'] as String?,
      correctAnswer: json['correct_answer'] as String?,
      incorrectAnswers: List<String>.from(json['incorrect_answers'] ?? []),
    );
  }

  Map<String, dynamic> toMap() => {
    "type": type,
    "difficulty": difficulty,
    "category": category,
    "question": question,
    "correct_answer": correctAnswer,
    "incorrect_answers": incorrectAnswers,
  };

  @override
  String toString() {
    return 'QuestionModel(type: $type, difficulty: $difficulty, category: $category, question: $question, correctAnswer: $correctAnswer, incorrectAnswers: $incorrectAnswers)';
  }
}
