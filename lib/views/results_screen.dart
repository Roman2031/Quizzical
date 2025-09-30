import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/result_model.dart';

class ResultScreen extends StatefulWidget {
  final ResultModel resultModel;
   // score in percentage

  ResultScreen({required this.resultModel});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// 🎉 Confetti image
                Image.asset(
                  'assets/results/congratulations.png',
                  height: 300,
                ),

                 SizedBox(height: 32),

                /// 🎯 Congratulation Text
                Text(
                  'Congratulation',
                  style: GoogleFonts.aoboshiOne(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D2D2D),
                  ),
                ),

                 SizedBox(height: 24),

                /// 🟩 Score Box
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(
                    color:  Color(0xFFE6F9E8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color:  Color(0xFFB6EBC3)),
                  ),
                  child: Text(
                    'You scored ${(widget.resultModel.correctAnswers / widget.resultModel.totalQuestion * 100).toStringAsFixed(0)}%',
                    style:  GoogleFonts.aoboshiOne(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF008000), // Green
                    ),
                  ),
                ),

                 SizedBox(height: 20),

                /// 📝 Subtext
                 Text(
                  "You've got a great foundation. Ready to try a\ndifferent category?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.balooTamma2(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                 SizedBox(height: 40),

                /// 🔁 Play Again Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAllNamed('/categoriesScreen'); // or go to category screen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Color(0xFF00796B), // teal
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:  Text(
                      'PLAY AGAIN',
                      style: GoogleFonts.baloo2(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
