import 'package:dio/dio.dart';

class DioHelper {
  Dio dio = Dio();
  // singleton
  static final DioHelper instance = DioHelper._();
  DioHelper._();

  Future<Response> get(String url) async => await dio.get(url);
  Future<Response> post(String url, Map<String, dynamic> data) async =>
      await dio.post(url, data: data);
}
