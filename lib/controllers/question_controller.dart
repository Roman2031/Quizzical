
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/services/question_services.dart';
import '../models/category_model.dart';
import '../models/question_model.dart';
import '../services/category_services.dart';
class QuestionController extends GetxController {
  // Observable variable to hold the currently selected category index (or ID/Name).
  // We'll use the category name for simplicity here.
  RxInt selectedCategory = 0.obs;
  RxBool isLoading = false.obs;
  List<QuestionModel> questionList = <QuestionModel>[].obs;

  void getQuestionList({required int amount,
    required int category,
    required String difficulty,
    required String type,}) async{
    isLoading.value = true;
    final categoryServices = QuestionServices();
   await categoryServices.getQuestionList(amount: amount,category: category,difficulty: difficulty,type: type).then((value) {
      questionList.addAll(value);
    });
    isLoading.value = false;
  }

  void selectCategory(int categoryId) {
    selectedCategory.value = categoryId;
    Get.toNamed('/quiz_configuration_screen', arguments: categoryId);
  }
}