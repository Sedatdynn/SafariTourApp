import 'package:dio/dio.dart';

import '../../../product/enums/requestsPath/safari_requests.dart';
import '../../../product/extension/requestsPath/safari_requests.dart';
import '../model/tour_model.dart';

abstract class IGeneralService {
  final Dio dio;
  IGeneralService(this.dio);
  final homePath = ISafariPath.all.rawValue;

  Future<List<Tour>?> fetchTourItems();
}
