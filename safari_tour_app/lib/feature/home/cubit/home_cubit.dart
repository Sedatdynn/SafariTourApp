import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/tour_model.dart';
import '../service/i_home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.generalService) : super(HomeInitial()) {
    _pageNumber = 1;
  }
  final IGeneralService generalService;
  late int _pageNumber;
  bool isPagingLoading = false;
  bool isPagingDone = false;

  List<Tour> allItems = [];
  late List<Tour> allPageItems;

  Future<void> fetchAllItems() async {
    emit(HomeLoading(true));
    final a = (await generalService.fetchTourItems(page: _pageNumber)) ?? [];
    try {
      allItems = a;
      if (allItems.isEmpty) {
        emit(HomeItemsLoaded(allItems));
      }
      allPageItems = allItems;
      emit(HomeItemsLoaded(allItems));
    } catch (e) {
      emit(HomeError(allItems.toString()));
    }
  }

  Future<void> fetchAllItemPaging() async {
    _changePagingLoading();
    emit(HomeItemsLoaded(allPageItems));

    if (isPagingLoading) {
      return;
    }
    _pageNumber += 1;
    final allItems = await generalService.fetchTourItems(page: _pageNumber);
    _changePagingLoading();

    if (allItems == null) {
      isPagingDone = true;
      return;
    }

    allPageItems.addAll(allItems);

    emit(HomeItemsLoaded(allPageItems));
  }

  void _changePagingLoading() {
    isPagingLoading = !isPagingLoading;
  }
}
