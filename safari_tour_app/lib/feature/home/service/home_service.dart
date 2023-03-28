import 'dart:io';

import 'package:safari_tour_app/feature/home/model/home_model.dart';
import 'package:safari_tour_app/product/widget/Text/wrongText/wrong_text_view.dart';

import 'i_home_service.dart';

class GeneralService extends IGeneralService {
  GeneralService(
    super.dio,
    super.item,
  );

  @override
  Future<List<Results>?> fetchTourItems() async {
    try {
      final response = await dio.get("/api/safari/all");
      var resData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        List<Results>? results = HomeModel.fromJson(resData).results;
        // print("++++++++++++${results![0].tour_data?.overview}");
        return results;
      }
    } catch (e) {
      throw e.toString();
    }

    throw const WrongText();
  }
}
