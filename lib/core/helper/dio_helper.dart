import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio dio = Dio()..interceptors.add(PrettyDioLogger());
  // singleton
  static final DioHelper instance = DioHelper._();
  DioHelper._();

  Future<Response> get(String url) async => await dio.get(url);
  Future<Response> post(String url, Map<String, dynamic> data) async =>
      await dio.post(url, data: data);
}
