import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

// ------------------------------------------------------------------
// 1. GETX CONTROLLER
// ------------------------------------------------------------------


// ------------------------------------------------------------------
// 2. VIEW (StatelessWidget with GetX)
// ------------------------------------------------------------------
class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  // Inject the controller
  final WelcomeController controller = Get.put(WelcomeController());

  // Dummy colors and dimensions for approximation
  static  Color primaryColor = Color(0xFF1B8A7E); // Teal/Dark Green
  static  Color accentColor = Color(0xFFE4AD1E); // Yellow/Orange
  static  Color titleColor = Color(0xFF333333); // Dark Gray

  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive design
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              // --- 1. Main Content (Illustration and Title) ---
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1), // Top padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Placeholder for the custom illustration
                        // In a real app, this would be an Image.asset('assets/quizzical_art.png')
                        Container(
                          height: screenHeight * 0.4, // Responsive height for the image area
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Center( child: Column(
                            children: [
                              Positioned(
                                top: 50,
                                right: 0,
                                child: Image(image: AssetImage('assets/welcome/welcome.png'), width: screenHeight * 0.4, height: screenHeight * 0.4)
                              ),
                            ],
                          ),
                        )),
                        
                         SizedBox(height: 30),
                        
                        // Title Text
                        Text(
                          'Quizzical',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                            // Use a custom font to match the image perfectly
                            // fontFamily: 'CustomFontName', 
                          ),
                        ),
                         SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),

              // --- 2. Bottom Button ---
              Padding(
                padding:  EdgeInsets.only(bottom: 40.0), // Bottom margin for the button
                child: Obx(
                  () => SizedBox(
                    width: double.infinity,
                    height: 60, // Fixed height for a prominent button
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value ? null : controller.onGetStarted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor, // Use the dark green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // Rounded corners
                        ),
                        elevation: 5,
                      ),
                      child: controller.isLoading.value
                          ?  CircularProgressIndicator(color: Colors.white)
                          :  Text(
                              'GET STARTED',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: 1.5,
                              ),
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

// ------------------------------------------------------------------
// 3. MAIN/ROUTING SETUP EXAMPLE (Optional, for completeness)
// ------------------------------------------------------------------
/*
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Use GetMaterialApp for GetX routing/snackbars
      title: 'Quizzical App',
      home: QuizzicalScreen(),
      theme: ThemeData(
        primaryColor: QuizzicalScreen.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
*/