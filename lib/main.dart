import 'package:flutter/material.dart';
import 'binding/quiz_categories_bindings.dart';
import 'views/quiz_configuration_screen.dart';
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
      GetPage(name: '/quiz_configuration_screen', page: () => QuizConfigurationScreen(selectedCategoryId: Get.arguments as int), binding: QuizCategoriesBinding()),
      // GetPage(name: '/quiz', page: () => QuizScreen(), binding: QuizBinding()),
      // GetPage(name: '/results', page: () => ResultScreen(), binding: QuizBinding()),
    ],
  ));
}
