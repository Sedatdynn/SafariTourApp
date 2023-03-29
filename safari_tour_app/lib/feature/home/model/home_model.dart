import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/feature/home/model/tour_model.dart';
part "home_model.g.dart";

@JsonSerializable()
class HomeModel {
  int? count;
  String? next;
  List<Tour>? results;

  HomeModel({this.count, this.next, this.results});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}
