// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/launch/view/launch.dart';
import 'package:safari_tour_app/product/const/text/app_text.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/const/border/border_radi.dart';
import '../../../product/widget/Text/wrongText/wrong_text_view.dart';
import '../../../product/widget/homeError/home_error_view.dart';
import '../../../product/widget/loading/loading_view.dart';
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
          return const LoadingView();
        } else if (state is HomeItemsLoaded) {
          return buildScaffoldBody(context);
        } else if (state is HomeError) {
          return HomeErrorView(state);
        }
        return const WrongText();
      });
    });
  }

  Scaffold buildScaffoldBody(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove("access");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LaunchView(),
                    ));
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: ListView.builder(
            itemCount: context.read<HomeCubit>().allItems.length,
            itemBuilder: (context, index) {
              print(
                  "-----${context.read<HomeCubit>().allItems[index].tour_data?.overview?.route_data}");
              return Container(
                margin: context.lowAllPadding,
                padding: context.lowAllPadding,
                decoration: const BoxDecoration(
                    color: AppColors.button,
                    borderRadius: BorderRadi.lowCircular),
                height: context.dynamicHeight(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(context
                        .read<HomeCubit>()
                        .allItems[index]
                        .imageCover
                        .toString()),
                    Text(
                      context.read<HomeCubit>().allItems[index].name ?? "",
                      style:
                          TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                    ),
                    Text(
                      context.read<HomeCubit>().allItems[0].price.toString(),
                      style:
                          TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                    ),
                    Text(
                      context
                              .read<HomeCubit>()
                              .allItems[index]
                              .tour_data
                              ?.overview
                              ?.route_data?[0]
                              .day_0
                              ?.days ??
                          "",
                      style:
                          TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
