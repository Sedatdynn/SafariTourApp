import 'package:dio/dio.dart';
import 'package:safari_tour_app/feature/home/model/home_model.dart';

import '../model/tour_model.dart';

abstract class IGeneralService {
  IGeneralService(
    this.dio,
    this.item,
  );
  final Dio dio;
  String item;

  Future<List<Tour>?> fetchTourItems();
}
