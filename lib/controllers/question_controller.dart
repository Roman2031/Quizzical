import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/services/question_services.dart';
import '../models/category_model.dart';
import '../models/all_question__model.dart';
import '../services/category_services.dart';
import 'package:get_storage/get_storage.dart';

class QuestionController extends GetxController {
  // Observable variable to hold the currently selected category index (or ID/Name).
  // We'll use the category name for simplicity here.
  RxInt selectedCategory = 0.obs;
  RxBool isLoading = false.obs;
  RxList<AllQuestionModel> questionList = <AllQuestionModel>[].obs;

  Future<void> getQuestionList({
    required int amount,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    try {      
    isLoading.value = true;
    final questionServices = QuestionServices();
      final List<AllQuestionModel> value = await questionServices.getQuestionList(
        amount: amount,
        category: category,
        difficulty: difficulty,
        type: type,
      );
      questionList.clear();
      questionList.addAll(value);
      if (questionList.isEmpty) {
        Get.snackbar(
          'No Questions Found',
          'No questions available for the selected configuration. Please try different settings.',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      GetStorage().write('quesitonList', questionList);
      print(GetStorage().read('quesitonList'));
      Get.toNamed('/single_question_screen');

    } catch (e) {
      debugPrint('Failed to load questions: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void selectCategory(int categoryId) {
    selectedCategory.value = categoryId;
    Get.toNamed('/quiz_configuration_screen', arguments: categoryId);
  }
}
