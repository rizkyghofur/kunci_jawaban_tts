import 'package:dio/dio.dart';
import 'package:kunci_jawaban_tts/constants/Constants.dart';
import 'package:kunci_jawaban_tts/models/responses/CariDataResponse.dart';
import 'package:kunci_jawaban_tts/utils/Injector.dart';

class CariData {
  final Dio dio = locator<Dio>();
  Future<CariDataResponse> cariData(String kata) async {
    try {
      dio.options.contentType = "";
      Response response = await dio.get(Constants.url + kata);
      var map = Map<String, dynamic>.from(response.data);
      var fetchedResponse = CariDataResponse.fromJson(map);
      return fetchedResponse;
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
