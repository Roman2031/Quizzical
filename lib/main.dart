import 'package:flutter/material.dart';
import 'binding/quiz_categories_bindings.dart';
import 'views/welcome_screen.dart';
import 'views/categories_screen.dart';
// import 'screens/quiz_config_screen.dart';
// import 'screens/quiz_screen.dart';
// import 'screens/result_screen.dart';
// import 'bindings/quiz_binding.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/welcome',
    getPages: [
      GetPage(name: '/welcome', page: () => WelcomeScreen()),
      GetPage(name: '/CategoriesScreen', page: () => CategoriesScreen(), binding: QuizCategoriesBinding()),
      // GetPage(name: '/quiz-config', page: () => QuizConfigScreen(), binding: QuizBinding()),
      // GetPage(name: '/quiz', page: () => QuizScreen(), binding: QuizBinding()),
      // GetPage(name: '/results', page: () => ResultScreen(), binding: QuizBinding()),
    ],
  ));
}
