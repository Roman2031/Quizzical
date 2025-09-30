import 'package:get/get.dart';
import '../controllers/categories_controller.dart';

class QuizCategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesController>(() => CategoriesController());

     // List of all categories with their data
  //   Future<List<CategoryModel>> categoryList() async {
  //   final categoryServices = CategoryServices();
  //   List<CategoryModel> getPosts = await categoryServices.categoryList();
  //   return getPosts;
  // }
   }
}
