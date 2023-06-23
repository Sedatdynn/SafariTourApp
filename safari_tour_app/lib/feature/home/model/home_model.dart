import 'package:json_annotation/json_annotation.dart';
import 'package:safari_tour_app/core/base/base_model.dart';
import 'package:safari_tour_app/feature/home/model/tour_model.dart';

part "home_model.g.dart";

@JsonSerializable()
class HomeModel extends BaseModel<HomeModel> {
  final int? count;
  final String? next;
  final List<Tour>? results;

  HomeModel({this.count, this.next, this.results});

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  List<Object?> get props => [count, next, results];

  HomeModel copyWith({
    int? count,
    String? next,
    List<Tour>? results,
  }) {
    return HomeModel(
      count: count ?? this.count,
      next: next ?? this.next,
      results: results ?? this.results,
    );
  }
}
