// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      count: json['count'] as int?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'results': instance.results,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      id: json['id'] as int?,
      imageCover: json['imageCover'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      price: json['price'] as String?,
      maxPrice: json['maxPrice'] as String?,
      ratingsQuantity: json['ratingsQuantity'] as int?,
      ratingsAverage: json['ratingsAverage'] as String?,
      tour_data: json['tour_data'] == null
          ? null
          : TourData.fromJson(json['tour_data'] as Map<String, dynamic>),
      inclusionsData: json['inclusionsData'] == null
          ? null
          : InclusionsData.fromJson(
              json['inclusionsData'] as Map<String, dynamic>),
      gettingThereData: (json['gettingThereData'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dayByDay: (json['dayByDay'] as List<dynamic>?)
          ?.map((e) => DayByDay.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'id': instance.id,
      'imageCover': instance.imageCover,
      'name': instance.name,
      'url': instance.url,
      'price': instance.price,
      'maxPrice': instance.maxPrice,
      'ratingsQuantity': instance.ratingsQuantity,
      'ratingsAverage': instance.ratingsAverage,
      'tour_data': instance.tour_data,
      'inclusionsData': instance.inclusionsData,
      'gettingThereData': instance.gettingThereData,
      'dayByDay': instance.dayByDay,
    };

TourData _$TourDataFromJson(Map<String, dynamic> json) => TourData(
      overview: json['overview'] == null
          ? null
          : Overview.fromJson(json['overview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TourDataToJson(TourData instance) => <String, dynamic>{
      'overview': instance.overview,
    };

Overview _$OverviewFromJson(Map<String, dynamic> json) => Overview(
      route_data: (json['route_data'] as List<dynamic>?)
          ?.map((e) => RouteData.fromJson(e as Map<String, dynamic>))
          .toList(),
      tourFeatures: (json['tourFeatures'] as List<dynamic>?)
          ?.map((e) => TourFeatures.fromJson(e as Map<String, dynamic>))
          .toList(),
      routeDescription: json['routeDescription'] as String?,
      accommodationAndMeals: (json['accommodationAndMeals'] as List<dynamic>?)
          ?.map(
              (e) => AccommodationAndMeals.fromJson(e as Map<String, dynamic>))
          .toList(),
      activitiesAndTransportation:
          (json['activitiesAndTransportation'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
    );

Map<String, dynamic> _$OverviewToJson(Overview instance) => <String, dynamic>{
      'route_data': instance.route_data,
      'tourFeatures': instance.tourFeatures,
      'routeDescription': instance.routeDescription,
      'accommodationAndMeals': instance.accommodationAndMeals,
      'activitiesAndTransportation': instance.activitiesAndTransportation,
    };

RouteData _$RouteDataFromJson(Map<String, dynamic> json) => RouteData(
      day_0: json['day_0'] == null
          ? null
          : Day0.fromJson(json['day_0'] as Map<String, dynamic>),
      day_1: json['day_1'] == null
          ? null
          : Day0.fromJson(json['day_1'] as Map<String, dynamic>),
      day_2: json['day_2'] == null
          ? null
          : Day1.fromJson(json['day_2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RouteDataToJson(RouteData instance) => <String, dynamic>{
      'day_0': instance.day_0,
      'day_1': instance.day_1,
      'day_2': instance.day_2,
    };

Day0 _$Day0FromJson(Map<String, dynamic> json) => Day0(
      days: json['days'] as String?,
      daysRoute: json['daysRoute'] as String?,
    );

Map<String, dynamic> _$Day0ToJson(Day0 instance) => <String, dynamic>{
      'days': instance.days,
      'daysRoute': instance.daysRoute,
    };

TourFeatures _$TourFeaturesFromJson(Map<String, dynamic> json) => TourFeatures(
      feature0: json['feature0'] == null
          ? null
          : Feature0.fromJson(json['feature0'] as Map<String, dynamic>),
      feature1: json['feature1'] == null
          ? null
          : Feature0.fromJson(json['feature1'] as Map<String, dynamic>),
      feature2: json['feature2'] == null
          ? null
          : Feature0.fromJson(json['feature2'] as Map<String, dynamic>),
      feature3: json['feature3'] == null
          ? null
          : Feature0.fromJson(json['feature3'] as Map<String, dynamic>),
      feature4: json['feature4'] == null
          ? null
          : Feature0.fromJson(json['feature4'] as Map<String, dynamic>),
      feature5: json['feature5'] == null
          ? null
          : Feature0.fromJson(json['feature5'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TourFeaturesToJson(TourFeatures instance) =>
    <String, dynamic>{
      'feature0': instance.feature0,
      'feature1': instance.feature1,
      'feature2': instance.feature2,
      'feature3': instance.feature3,
      'feature4': instance.feature4,
      'feature5': instance.feature5,
    };

Feature0 _$Feature0FromJson(Map<String, dynamic> json) => Feature0(
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$Feature0ToJson(Feature0 instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

AccommodationAndMeals _$AccommodationAndMealsFromJson(
        Map<String, dynamic> json) =>
    AccommodationAndMeals(
      accommodation0: json['accommodation0'] == null
          ? null
          : Accommodation0.fromJson(
              json['accommodation0'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccommodationAndMealsToJson(
        AccommodationAndMeals instance) =>
    <String, dynamic>{
      'accommodation0': instance.accommodation0,
    };

Accommodation0 _$Accommodation0FromJson(Map<String, dynamic> json) =>
    Accommodation0(
      day: json['day'] as String?,
      meals: json['meals'] as String?,
      accommodation: json['accommodation'] == null
          ? null
          : Accommodation.fromJson(
              json['accommodation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Accommodation0ToJson(Accommodation0 instance) =>
    <String, dynamic>{
      'day': instance.day,
      'meals': instance.meals,
      'accommodation': instance.accommodation,
    };

Accommodation _$AccommodationFromJson(Map<String, dynamic> json) =>
    Accommodation(
      image: json['image'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AccommodationToJson(Accommodation instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
    };

InclusionsData _$InclusionsDataFromJson(Map<String, dynamic> json) =>
    InclusionsData(
      inclusions: json['inclusions'] == null
          ? null
          : Inclusions.fromJson(json['inclusions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InclusionsDataToJson(InclusionsData instance) =>
    <String, dynamic>{
      'inclusions': instance.inclusions,
    };

Inclusions _$InclusionsFromJson(Map<String, dynamic> json) => Inclusions(
      excluded: (json['excluded'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      included: (json['included'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InclusionsToJson(Inclusions instance) =>
    <String, dynamic>{
      'excluded': instance.excluded,
      'included': instance.included,
    };

DayByDay _$DayByDayFromJson(Map<String, dynamic> json) => DayByDay(
      day1: json['day1'] == null
          ? null
          : Day0.fromJson(json['day1'] as Map<String, dynamic>),
      day2: json['day2'] == null
          ? null
          : Day1.fromJson(json['day2'] as Map<String, dynamic>),
      day3: json['day3'] == null
          ? null
          : Day1.fromJson(json['day3'] as Map<String, dynamic>),
      day4: json['day4'] == null
          ? null
          : Day1.fromJson(json['day4'] as Map<String, dynamic>),
      day5: json['day5'] == null
          ? null
          : Day1.fromJson(json['day5'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayByDayToJson(DayByDay instance) => <String, dynamic>{
      'day1': instance.day1,
      'day2': instance.day2,
      'day3': instance.day3,
      'day4': instance.day4,
      'day5': instance.day5,
    };

Day1 _$Day1FromJson(Map<String, dynamic> json) => Day1(
      image: json['image'] as String?,
      description: json['description'] as String?,
      destination: json['destination'] as String?,
    );

Map<String, dynamic> _$Day1ToJson(Day1 instance) => <String, dynamic>{
      'image': instance.image,
      'description': instance.description,
      'destination': instance.destination,
    };
