import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/home/model/home_model.dart';

import '../service/i_home_service.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.generalService) : super(HomeInitial());
  final IGeneralService generalService;

  List<Results> allItems = [];

  Future<void> fetchAllItems() async {
    final a = (await generalService.fetchTourItems()) ?? [];
    print("//-----------" + a[0].price.toString());
    // print("//-----------" +
    //         a[0]
    //             .tourData
    //             ?.overview
    //             ?.tourFeatures?[1]
    //             .feature0
    //             ?.title
    //             .toString() ??
    //     "sss");

    try {
      allItems = a;
      emit(HomeItemsLoaded(allItems));
    } catch (e) {
      emit(HomeError(allItems.toString()));
    }
  }
}
