import 'package:dio/dio.dart';
import 'package:kunci_jawaban_tts/interceptors/LoggingInterceptors.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future baseDio() async {
  final options = BaseOptions(
    connectTimeout: 100000,
    receiveTimeout: 100000,
  );

  var dio = Dio(options);

  dio.interceptors.add(LoggingInterceptors());

  locator.registerSingleton<Dio>(dio);
}
