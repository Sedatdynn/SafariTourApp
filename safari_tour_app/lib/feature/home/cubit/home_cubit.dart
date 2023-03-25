import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/home/model/home_model.dart';

import '../service/i_home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.generalService) : super(HomeInitial());
  final IGeneralService generalService;

  List<Results> allItems = [];

  Future<void> fetchAllItems() async {
    try {
      final allItems = (await generalService.fetchTourItems()) ?? [];
      print("-------" + allItems.toString());
      print("-------" + allItems.length.toString());
      emit(HomeItemsLoaded(allItems));
    } catch (e) {
      emit(HomeError(allItems.toString()));
    }
  }
}
