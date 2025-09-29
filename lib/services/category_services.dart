// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:dio/dio.dart';
import '../models/category_model.dart';

class CategoryServices {
   Dio dio = Dio();
  String urlLink = 'https://opentdb.com/api_category.php';
  
  Future<List<CategoryModel>> categoryList() async {
       dio.options.contentType = Headers.formUrlEncodedContentType;
        dio.options = BaseOptions(
        baseUrl: urlLink,
        contentType: Headers.jsonContentType);
      try {
      Response response =
          await dio.get(Uri.encodeFull(urlLink));
      if (response.statusCode == 200) {
       var result = response.data['trivia_categories'] as List;
      List<CategoryModel> listData =
          result.map((tagJson) => CategoryModel.fromJson(tagJson)).toList();
      return listData;
      } else {
        throw Exception("Error");
      }
    } catch (error, stackTrace) {
      print("Exception occurred: $error  stackTrace: $stackTrace");
      return throw Exception("Error");
    }
  }
}