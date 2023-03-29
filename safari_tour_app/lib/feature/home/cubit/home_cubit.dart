import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/tour_model.dart';
import '../service/i_home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.generalService) : super(HomeInitial());
  final IGeneralService generalService;

  List<Tour> allItems = [];

  Future<void> fetchAllItems() async {
    final a = (await generalService.fetchTourItems()) ?? [];

    try {
      allItems = a;
      emit(HomeItemsLoaded(allItems));
    } catch (e) {
      emit(HomeError(allItems.toString()));
    }
  }
}
