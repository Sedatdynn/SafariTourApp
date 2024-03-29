import '../model/tour_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  final bool isLoading;

  HomeLoading(this.isLoading);
}

class HomeItemsLoaded extends HomeState {
  final List<Tour> items;
  HomeItemsLoaded(this.items);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
