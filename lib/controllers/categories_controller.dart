
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzical/services/category_services.dart';
import '../binding/quiz_categories_bindings.dart';
import '../models/category_model.dart';
class CategoriesController extends GetxController {
  // Observable variable to hold the currently selected category index (or ID/Name).
  // We'll use the category name for simplicity here.
  RxInt selectedCategory = 0.obs;
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

  void selectCategory(int categoryId) {
    selectedCategory.value = categoryId;
    Get.toNamed('/quiz_configuration_screen', arguments: categoryId);
  }
}