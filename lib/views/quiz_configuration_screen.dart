import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quiz_configure_controller.dart';
import 'package:google_fonts/google_fonts.dart';
// Assuming the QuizConfigController is in 'quiz_config_controller.dart'
// import 'quiz_config_controller.dart'; 

class QuizConfigurationScreen extends StatefulWidget {
  int selectedCategoryId; // Default to 0 if no argument is passed
   QuizConfigurationScreen({super.key, required this.selectedCategoryId});

  @override
  _QuizConfigurationScreenState createState() => _QuizConfigurationScreenState();
}

class _QuizConfigurationScreenState extends State<QuizConfigurationScreen> {
  // Instantiate the controller only once
  final QuizConfigController controller = Get.put(QuizConfigController());

  @override
  Widget build(BuildContext context) {
    // Using MediaQuery to get the screen height/width for adaptive padding/sizing
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // Optional: Ensure the UI doesn't interfere with the system notch (like the dynamic island)
      // We will leave the notch visible to mimic the image
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Spacing to push content down, mimicking the image layout
              SizedBox(height: screenSize.height * 0.1), 

              // Image/Illustration Section
              Center(
                child: SizedBox(
                  // Placeholder for the illustration (Image of person setting controls)
                  child: Container(
                    child: Center(
                       // Replace this with the actual image asset
                       child: Image(image:  AssetImage('assets/quiz_configure/hand_pressing.png',),width: screenSize.width * 0.7, height: screenSize.width * 0.5), 
                    ),
                  ),
                ),
              ),

               SizedBox(height: 30),

              // Title Section
               Text(
                'Quizzical',
                textAlign: TextAlign.center,
                style: GoogleFonts.aoboshiOne(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2749), // Dark blue/black color from image
                ),
              ),
               SizedBox(height: 5),
               Text(
                'Configuration',
                textAlign: TextAlign.center,
                style: GoogleFonts.balooBhai2(
                  fontSize: 18,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w400,
                ),
              ),

               SizedBox(height: 40),

              // Number of Questions Slider
               Text(
                'Number of Questions',
                style: GoogleFonts.balooBhai2(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E2749),
                ),
              ),
               SizedBox(height: 10),
              Obx(() => Row(
                children: [
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2.0,
                        thumbShape:  RoundSliderThumbShape(enabledThumbRadius: 6.0),
                        activeTrackColor: Colors.blueAccent, // Color from image
                        inactiveTrackColor: Colors.grey[300],
                        thumbColor: Colors.blueAccent,
                        overlayColor: Colors.blueAccent.withOpacity(0.2),
                      ),
                      child: Slider(
                        value: controller.numberOfQuestions,
                        min: 1.0,
                        max: 50.0,
                        divisions: 49, // 1 to 50
                        label: controller.numberOfQuestions.round().toString(),
                        onChanged: controller.setNumberOfQuestions,
                      ),
                    ),
                  ),
                   SizedBox(width: 10),
                  Text(
                    '${controller.numberOfQuestions.toInt()}',
                    style:  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              )),
              
               SizedBox(height: 30),

              // Difficulty Level Dropdown
               Text(
                'Difficulty Level',
                style: GoogleFonts.balooBhai2(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E2749),
                ),
              ),
               SizedBox(height: 10),
              Obx(() => Container(
                padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: controller.difficultyLevel,
                    icon:  Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    style:  TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1E2749),
                    ),
                    onChanged: controller.setDifficultyLevel,
                    items: controller.difficultyOptions
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: GoogleFonts.balooBhai2(),),
                      );
                    }).toList(),
                  ),
                ),
              )),

              // Flexible space to push the button to the bottom
               Spacer(), 

              // START Button
              Padding(
                padding:  EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: controller.startQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // White background
                      foregroundColor: Colors.green, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // Rounded corners
                        side:  BorderSide(color: Colors.green, width: 2), // Green border
                      ),
                      elevation: 0, // No shadow
                    ),
                    child:  Text(
                      'START',
                      style: GoogleFonts.baloo2(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
