import 'dart:io';

import 'package:safari_tour_app/feature/home/model/home_model.dart';
import 'package:safari_tour_app/product/widget/Text/wrongText/wrong_text_view.dart';

import '../../../product/enums/page/page_enum.dart';
import '../model/tour_model.dart';
import 'i_home_service.dart';

class GeneralService extends IGeneralService {
  GeneralService(
    super.dio,
  );

  @override
  Future<List<Tour>?> fetchTourItems({int page = 0}) async {
    try {
      final response = await dio.get(
        homePath,
        queryParameters: Map.fromEntries(
          [NetworkQuery.page.pageQuery(page)],
        ),
      );
      var resData = response.data;
      if (response.statusCode == HttpStatus.ok) {
        List<Tour>? results = HomeModel.fromJson(resData).results;
        return results;
      }
    } catch (e) {
      return null;
    }

    throw const WrongText();
  }
}
