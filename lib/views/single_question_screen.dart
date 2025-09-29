import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/controllers/single_question_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleQuestionScreen extends StatelessWidget {
  final SingleQuestionController controller = Get.put(SingleQuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF6F6F6),
      body: SafeArea(
        child: Obx(() {
          final question = controller.questions[controller.currentIndex.value];

          return Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(  context).size.width * 0.2), // Placeholder for alignment
                    Text(
                      "${controller.currentIndex.value + 1}/${controller.questions.length}",
                      style: GoogleFonts.baloo2(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    TextButton.icon(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.exit_to_app),
                      label: Text("EXIT",style: GoogleFonts.aoboshiOne()),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                /// Question
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    question.question,
                    style: GoogleFonts.baloo2(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),

                /// Options
                ...question.incorrect_answers.map((option) {
                  bool isSelected = controller.selectedAnswer.value == option;
                  return GestureDetector(
                    onTap: () => controller.selectAnswer(option),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFFD6EADF) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(option, style: GoogleFonts.baloo2(fontSize: 16)),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black54),
                              color: isSelected ? Colors.black87 : Colors.transparent,
                            ),
                            width: 20,
                            height: 20,
                            child: isSelected
                                ? Icon(Icons.check, color: Colors.white, size: 14)
                                : null,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),

                Spacer(),

                /// Next Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.nextQuestion(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004B3E),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text("Next", style: GoogleFonts.baloo2(fontSize: 16)),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
