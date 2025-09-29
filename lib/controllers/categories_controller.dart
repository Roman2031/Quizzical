
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/services/category_services.dart';
import '../binding/quiz_categories_bindings.dart';
import '../models/category_model.dart';
class CategoriesController extends GetxController {
  // Observable variable to hold the currently selected category index (or ID/Name).
  // We'll use the category name for simplicity here.
  var selectedCategory = 'None'.obs;
  RxBool isLoading = false.obs;
  List<CategoryModel> categoryList = <CategoryModel>[].obs;

  void getCategoryList(){
    isLoading.value = true;
    final categoryServices = CategoryServices();
    categoryServices.categoryList().then((value) {
      categoryList.addAll(value);
    });
    isLoading.value = false;
  }

 

  // Method to update the selected category
  void selectCategory(String categoryName) {
    selectedCategory.value = categoryName;
    // In a real app, you'd navigate here, e.g.:
    // Get.toNamed('/quiz', arguments: categoryName);
    Get.snackbar(
      'Category Selected',
      '$categoryName is ready for your quiz!',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}