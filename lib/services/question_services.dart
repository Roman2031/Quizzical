// ignore_for_file: depend_on_referenced_packages, must_be_immutable,avoid_print
import 'package:dio/dio.dart';
import '../models/all_question__model.dart';

class QuestionServices {
  Dio dio = Dio();

  Future<List<AllQuestionModel>> getQuestionList({
    required int amount,
    required int category,
    required String difficulty,
    required String type,
  }) async {
    //String urlLink =  https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=multiple
    String urlLink =
        'https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=$type';
    dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options = BaseOptions(
      baseUrl: urlLink,
      contentType: Headers.jsonContentType,
    );
    print('URL: $urlLink');
    try {
      Response response = await dio.get(Uri.encodeFull(urlLink));
      if (response.statusCode == 200) {
        List result = response.data["results"] as List;
        List<AllQuestionModel> listData = result
            .map((tagJson) => AllQuestionModel.fromJson(tagJson))
            .toList();
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
