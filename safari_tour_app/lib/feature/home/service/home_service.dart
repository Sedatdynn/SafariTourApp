import 'dart:io';

import 'package:safari_tour_app/feature/home/model/home_model.dart';

import 'i_home_service.dart';

class GeneralService extends IGeneralService {
  GeneralService(
    super.dio,
    super.item,
  );

  @override
  Future<List<Results>?> fetchTourItems() async {
    try {
      final response = await dio.get("/api/Results/");
      var resData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        List<Results>? results = HomeModel.fromJson(resData).results;
        return results;
      }
    } catch (e) {
      throw e.toString();
    }

    throw "Something went wrong";
  }
}
