import 'package:get/get.dart';

class WelcomeController extends GetxController {
  // Observables for state if needed (e.g., loading status)
  final RxBool isLoading = false.obs;

  void onGetStarted() {
     Get.toNamed('/CategoriesScreen');
  }
}