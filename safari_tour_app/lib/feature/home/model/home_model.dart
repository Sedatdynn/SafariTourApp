import 'package:json_annotation/json_annotation.dart';
part "home_model.g.dart";

@JsonSerializable()
class HomeModel {
  int? count;
  String? next;
  List<Results>? results;

  HomeModel({this.count, this.next, this.results});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}

@JsonSerializable()
class Results {
  int? id;
  String? imageCover;
  String? name;
  String? url;
  String? price;
  String? maxPrice;
  int? ratingsQuantity;
  String? ratingsAverage;
  TourData? tour_data;
  InclusionsData? inclusionsData;
  List<String>? gettingThereData;
  List<DayByDay>? dayByDay;

  Results(
      {this.id,
      this.imageCover,
      this.name,
      this.url,
      this.price,
      this.maxPrice,
      this.ratingsQuantity,
      this.ratingsAverage,
      this.tour_data,
      this.inclusionsData,
      this.gettingThereData,
      this.dayByDay});

  factory Results.fromJson(Map<String, dynamic> json) {
    return _$ResultsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResultsToJson(this);
  }
}

@JsonSerializable()
class TourData {
  Overview? overview;

  TourData({this.overview});

  factory TourData.fromJson(Map<String, dynamic> json) {
    return _$TourDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TourDataToJson(this);
  }
}

@JsonSerializable()
class Overview {
  List<RouteData>? route_data;
  List<TourFeatures>? tourFeatures;
  String? routeDescription;
  List<AccommodationAndMeals>? accommodationAndMeals;
  List<String>? activitiesAndTransportation;

  Overview(
      {this.route_data,
      this.tourFeatures,
      this.routeDescription,
      this.accommodationAndMeals,
      this.activitiesAndTransportation});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return _$OverviewFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OverviewToJson(this);
  }
}

@JsonSerializable()
class RouteData {
  Day0? day_0;
  Day0? day_1;
  Day1? day_2;

  RouteData({this.day_0, this.day_1, this.day_2});

  factory RouteData.fromJson(Map<String, dynamic> json) {
    return _$RouteDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RouteDataToJson(this);
  }
}

@JsonSerializable()
class Day0 {
  String? days;
  String? daysRoute;

  Day0({this.days, this.daysRoute});

  factory Day0.fromJson(Map<String, dynamic> json) {
    return _$Day0FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Day0ToJson(this);
  }
}

@JsonSerializable()
class TourFeatures {
  Feature0? feature0;
  Feature0? feature1;
  Feature0? feature2;
  Feature0? feature3;
  Feature0? feature4;
  Feature0? feature5;

  TourFeatures(
      {this.feature0,
      this.feature1,
      this.feature2,
      this.feature3,
      this.feature4,
      this.feature5});

  factory TourFeatures.fromJson(Map<String, dynamic> json) {
    return _$TourFeaturesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TourFeaturesToJson(this);
  }
}

@JsonSerializable()
class Feature0 {
  String? title;
  String? description;

  Feature0({this.title, this.description});

  factory Feature0.fromJson(Map<String, dynamic> json) {
    return _$Feature0FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Feature0ToJson(this);
  }
}

@JsonSerializable()
class AccommodationAndMeals {
  Accommodation0? accommodation0;

  AccommodationAndMeals({this.accommodation0});

  factory AccommodationAndMeals.fromJson(Map<String, dynamic> json) {
    return _$AccommodationAndMealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccommodationAndMealsToJson(this);
  }
}

@JsonSerializable()
class Accommodation0 {
  String? day;
  String? meals;
  Accommodation? accommodation;

  Accommodation0({this.day, this.meals, this.accommodation});

  factory Accommodation0.fromJson(Map<String, dynamic> json) {
    return _$Accommodation0FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Accommodation0ToJson(this);
  }
}

@JsonSerializable()
class Accommodation {
  String? image;
  String? title;
  String? description;

  Accommodation({this.image, this.title, this.description});

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return _$AccommodationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccommodationToJson(this);
  }
}

@JsonSerializable()
class InclusionsData {
  Inclusions? inclusions;

  InclusionsData({this.inclusions});

  factory InclusionsData.fromJson(Map<String, dynamic> json) {
    return _$InclusionsDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InclusionsDataToJson(this);
  }
}

@JsonSerializable()
class Inclusions {
  List<String>? excluded;
  List<String>? included;

  Inclusions({this.excluded, this.included});

  factory Inclusions.fromJson(Map<String, dynamic> json) {
    return _$InclusionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$InclusionsToJson(this);
  }
}

@JsonSerializable()
class DayByDay {
  Day0? day1;
  Day1? day2;
  Day1? day3;
  Day1? day4;
  Day1? day5;

  DayByDay({this.day1, this.day2, this.day3, this.day4, this.day5});

  factory DayByDay.fromJson(Map<String, dynamic> json) {
    return _$DayByDayFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DayByDayToJson(this);
  }
}

@JsonSerializable()
class Day1 {
  String? image;
  String? description;
  String? destination;

  Day1({this.image, this.description, this.destination});

  factory Day1.fromJson(Map<String, dynamic> json) {
    return _$Day1FromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$Day1ToJson(this);
  }
}
