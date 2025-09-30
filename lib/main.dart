import 'package:flutter/material.dart';
import 'binding/quiz_categories_bindings.dart';
import 'binding/single_question_binding.dart';
import 'models/all_question__model.dart';
import 'views/quiz_configuration_screen.dart';
import 'views/single_question_screen.dart';
import 'views/welcome_screen.dart';
import 'views/categories_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/welcome',
    getPages: [
      GetPage(name: '/welcome', page: () => WelcomeScreen()),
      GetPage(name: '/categoriesScreen', page: () => CategoriesScreen(), binding: QuizCategoriesBinding()),
      GetPage(name: '/quiz_configuration_screen', page: () => QuizConfigurationScreen(selectedCategoryId: Get.arguments as int), binding: QuizCategoriesBinding()),
      GetPage(name: '/single_question_screen', page: () => SingleQuestionScreen(quesitonList: Get.arguments as List<AllQuestionModel>), binding: SingleQuestionBinding()),
      // GetPage(name: '/results', page: () => ResultScreen(), binding: QuizBinding()),
    ],
  ));
}
