class Tour {
  late int id;
  late String imageCover;
  late String name;
  late String url;
  late String price;
  late String maxPrice;
  late int ratingsQuantity;
  late String ratingsAverage;
  late TourData tourData;
  late InclusionsData inclusionsData;
  late List<String> gettingThereData;
  late List<Map<String, DayByDayData>> dayByDay;

  Tour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageCover = json['imageCover'];
    name = json['name'];
    url = json['url'];
    price = json['price'];
    maxPrice = json['max_price'];
    ratingsQuantity = json['ratingsQuantity'];
    ratingsAverage = json['ratingsAverage'];
    tourData = TourData.fromJson(json['tour_data']);
    inclusionsData = InclusionsData.fromJson(json['inclusions_data']);
    gettingThereData = List<String>.from(json['getting_there_data']);
    dayByDay = List<Map<String, DayByDayData>>.from(json['day_by_day']
        .map((day) => Map<String, DayByDayData>.from(day.map((k, v) => MapEntry(k, DayByDayData.fromJson(v))))));
  }
}

class TourData {
  late List<Map<String, RouteData>> routeData;
  late List<Map<String, TourFeature>> tourFeatures;
  late String routeDescription;
  late List<Map<String, AccommodationAndMeal>> accommodationAndMeals;
  late List<String> activitiesAndTransportation;

  TourData.fromJson(Map<String, dynamic> json) {
    routeData = List<Map<String, RouteData>>.from(json['overview']['route_data']
        .map((route) => Map<String, RouteData>.from(route.map((k, v) => MapEntry(k, RouteData.fromJson(v))))));
    tourFeatures = List<Map<String, TourFeature>>.from(json['overview']['tour_features']
        .map((feature) => Map<String, TourFeature>.from(feature.map((k, v) => MapEntry(k, TourFeature.fromJson(v))))));
    routeDescription = json['overview']['route_description'];
    accommodationAndMeals = List<Map<String, AccommodationAndMeal>>.from(json['overview']['accomodaton_and_meals'].map(
        (accommodation) => Map<String, AccommodationAndMeal>.from(
            accommodation.map((k, v) => MapEntry(k, AccommodationAndMeal.fromJson(v))))));
    activitiesAndTransportation = List<String>.from(json['overview']['activities_and_transportation']);
  }
}

class RouteData {
  late String days;
  late String daysRoute;

  RouteData.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    daysRoute = json['days_route'];
  }
}

class TourFeature {
  late String title;
  late String description;

  TourFeature.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}

class AccommodationAndMeal {
  late String day;
  late String meals;
  late Accommodation accommodation;

  AccommodationAndMeal.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    meals = json['meals'];
    accommodation = Accommodation.fromJson(json['accommodation']);
  }
}

class Accommodation {
  late String image;
  late String title;
  late String description;

  Accommodation.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    description = json['description'];
  }
}

class InclusionsData {
  late Inclusions inclusions;

  InclusionsData.fromJson(Map<String, dynamic> json) {
    inclusions = Inclusions.fromJson(json['inclusions']);
  }
}

class Inclusions {
  late List<String> excluded;
  late List<String> included;

  Inclusions.fromJson(Map<String, dynamic> json) {
    excluded = List<String>.from(json['excluded']);
    included = List<String>.from(json['included']);
  }
}

class DayByDayData {
  late String image;
  late String description;
  late String destination;

  DayByDayData.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
    destination = json['destination'];
  }
}
