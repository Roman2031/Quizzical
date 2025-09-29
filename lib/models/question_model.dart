// class QuestionModel{    
//    String? type;
//    String? difficulty;
//    String? category;
//    String? question;
//    String? correct_answer;

//   QuestionModel(this.type,this.difficulty,this.category,this.question,this.correct_answer);

//   factory QuestionModel.fromJson(dynamic json) {
//     return QuestionModel(     
//       json['name'] as String?
//       );
//   }

//   @override
//   String toString() {
//     // ignore: unnecessary_this
//     return '{ ${this.id},${this.name}';
//   }
//   Map<String, dynamic> toMap() => { 
//         "id": id,
//         "title": name,
//       };
// }