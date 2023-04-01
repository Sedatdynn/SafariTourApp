import 'dart:io';

import 'package:safari_tour_app/feature/home/model/home_model.dart';
import 'package:safari_tour_app/product/widget/Text/wrongText/wrong_text_view.dart';

import '../model/tour_model.dart';
import 'i_home_service.dart';

class GeneralService extends IGeneralService {
  GeneralService(
    super.dio,
  );

  @override
  Future<List<Tour>?> fetchTourItems() async {
    try {
      final response = await dio.get(homePath);
      var resData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        List<Tour>? results = HomeModel.fromJson(resData).results;
        return results;
      }
    } catch (e) {
      throw e.toString();
    }

    throw const WrongText();
  }
}
