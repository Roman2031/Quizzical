
import 'package:get/get.dart';
import '../models/category_model.dart';
import '../services/category_services.dart';

class CategoriesController extends GetxController {
  // Observable variable to hold the currently selected category index (or ID/Name).
  // We'll use the category name for simplicity here.
  RxInt selectedCategory = 0.obs;
  RxBool isLoading = false.obs;
  List<CategoryModel> categoryList = <CategoryModel>[].obs;

  void getCategoryList() async {
    isLoading.value = true;
    final categoryServices = CategoryServices();
    await categoryServices.categoryList().then((value) {
      categoryList.addAll(value);
    });
    isLoading.value = false;
  }

  void selectCategory(int categoryId) {
    selectedCategory.value = categoryId;
    Get.toNamed('/quiz_configuration_screen', arguments: categoryId);
  }
}
