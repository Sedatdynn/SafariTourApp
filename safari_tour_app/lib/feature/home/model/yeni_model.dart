// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:safari_tour_app/feature/home/model/home_model.dart';

class Tour {
  String? id;
  String? name;
  String? destination;
  String? duration;
  String? description;
  List<RouteData>? route_data;
  List<TourFeatures>? tour_features;

  Tour(
      {this.id,
      this.name,
      this.destination,
      this.duration,
      this.description,
      this.route_data,
      this.tour_features});

  factory Tour.fromJson(Map<String, dynamic> json) {
    final tour = Tour();

    var all_overview = Overview.fromJson(json);

    List<dynamic> a = all_overview.route_data ?? [];
    List<dynamic> b = all_overview.tourFeatures ?? [];

    for (var element in a) {
      tour.route_data!.add(element);
    }

    for (var tour_feature in b) {
      tour.tour_features!.add(tour_feature);
    }

    return Tour(
      id: json['id'],
      name: json['name'],
      destination: json['destination'],
      duration: json['duration'],
      description: json['description'],
      route_data: tour.route_data,
      tour_features: tour.tour_features,
    );
  }
}
