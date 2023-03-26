import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

import '../../../product/const/border/border_radi.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is HomeInitial || state is HomeLoading) {
          return const CircularProgressIndicator();
        } else if (state is HomeItemsLoaded) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: context.height,
                child: ListView.builder(
                  itemCount: context.read<HomeCubit>().allItems.length,
                  itemBuilder: (context, index) {
                    print(
                        "--*---${context.read<HomeCubit>().allItems[index].tour_data}");
                    return Container(
                      margin: context.lowAllPadding,
                      padding: context.lowAllPadding,
                      decoration: BoxDecoration(
                          color: AppColors.button,
                          borderRadius: BorderRadi.lowCircular),
                      height: context.dynamicHeight(0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(context
                                  .read<HomeCubit>()
                                  .allItems[index]
                                  .imageCover ??
                              ""),
                          Text(
                            context.read<HomeCubit>().allItems[index].name ??
                                "",
                            style: TextStyle(
                                color: AppColors.mainPrimary, fontSize: 35),
                          ),
                          Text(
                            context
                                .read<HomeCubit>()
                                .allItems[index]
                                .price
                                .toString(),
                            style: TextStyle(
                                color: AppColors.mainPrimary, fontSize: 35),
                          ),
                          Text(
                            context
                                    .read<HomeCubit>()
                                    .allItems[index]
                                    .tour_data!
                                    .overview
                                    ?.route_data?[0]
                                    .day_0
                                    ?.days
                                    .toString() ??
                                "",
                            style: TextStyle(
                                color: AppColors.mainPrimary, fontSize: 35),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is HomeError) {
          return Text(state.message);
        }
        return const Center(child: Text("aaaaaaaa"));
      });
    });
  }
}
