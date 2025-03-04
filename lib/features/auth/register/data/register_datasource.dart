import 'package:edetik_app/core/helper/dio_helper.dart';
import 'package:edetik_app/features/auth/register/model/city_model.dart';
import 'package:edetik_app/features/auth/register/model/desa_model.dart';
import 'package:edetik_app/features/auth/register/model/subdistrict_model.dart';

import '../model/companion_model.dart';
import '../model/puskesmas_model.dart';

class RegisterDatasource {
  DioHelper dioHelper = DioHelper.instance;
  Future<List<CityModel>> readCity() async {
    final response =
        await dioHelper.get('https://edetik.edinkes.id/api/data/get-kabko');

    if (response.statusCode == 200) {
      final result = (response.data['data']['wilayah'] as List)
          .map((e) => CityModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception(response.data['data']['msg']);
    }
  }

  Future<List<SubdistrictModel>> readSubdistrict(String id) async {
    final response = await dioHelper.post(
      'https://edetik.edinkes.id/api/data/get-kecamatan',
      {
        'kabko': id,
      },
    );

    if (response.statusCode == 200) {
      final result = (response.data['data']['kecamatan'] as List)
          .map((e) => SubdistrictModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception(response.data['data']['msg']);
    }
  }

  Future<List<DesaModel>> readDesa(String id) async {
    final response = await dioHelper.post(
      'https://edetik.edinkes.id/api/data/get-desa',
      {
        'kecamatan': id,
      },
    );

    if (response.statusCode == 200) {
      final result = (response.data['data']['kecamatan'] as List)
          .map((e) => DesaModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception(response.data['data']['msg']);
    }
  }

  Future<List<PuskesmasModel>> readPuskesmas(String id) async {
    final response = await dioHelper.post(
      'https://edetik.edinkes.id/api/data/get-puskesmas',
      {
        'kecamatan': id,
      },
    );

    if (response.statusCode == 200) {
      final result = (response.data['data']['kecamatan'] as List)
          .map((e) => PuskesmasModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception(response.data['data']['msg']);
    }
  }

  Future<List<CompanionModel>> readCompanion(
      String desa, String puskesmas) async {
    final response = await dioHelper.post(
      'https://edetik.edinkes.id/api/data/get-pendamping',
      {'kd_puskesmas': puskesmas, 'kd_desa': desa},
    );

    if (response.statusCode == 200) {
      final result = (response.data['data']['pendamping'] as List)
          .map((e) => CompanionModel.fromJson(e))
          .toList();
      return result;
    } else {
      throw Exception(response.data['data']['pendamping']);
    }
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    await dioHelper.post(
      'https://edetik.edinkes.id/api/user/register',
      data,
    );
  }
}
