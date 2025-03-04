import 'package:dio/dio.dart';
import 'package:edetik_app/core/helper/result.dart';
import 'package:talker/talker.dart';

import '../model/login_model.dart';

class LoginDatasource {
  Future<Result<LoginModel>> login(String username, String password) async {
    Dio dio = Dio();
    final response = await dio.post('https://edetik.edinkes.id/api/user/login',
        data: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      return Result.ok(LoginModel.fromJson(response.data));
    } else {
      final talker = Talker();
      talker.handle(response.data['message']);
      return Result.error(Exception(response.data['message']));
    }
  }
}
