// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safari_tour_app/feature/launch/view/launch.dart';
import 'package:safari_tour_app/feature/splash/model/user_response_model.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/routes/app_route.gr.dart';
import '../../../product/const/border/border_radi.dart';
import '../../../product/utility/Text/wrongText/wrong_text_view.dart';
import '../../../product/utility/homeError/home_error_view.dart';
import '../../../product/utility/loading/loading_view.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
    this.currentUser,
  }) : super(key: key);
  final UserProfileResponse? currentUser;
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
          return NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
                final notificationContext = notification.context;
                if (notificationContext != null && !context.read<HomeCubit>().isPagingDone) {
                  notificationContext.read<HomeCubit>().fetchAllItemPaging();
                }
              }
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () async {
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.remove("access");
                        if (context.mounted) {
                          AutoRouter.of(context).replace(const LaunchRoute());
                        }
                      },
                      icon: const Icon(Icons.logout_outlined))
                ],
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: context.dynamicHeight(0.85),
                  child: ListView.builder(
                    itemCount: context.read<HomeCubit>().allItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: context.extremeAllPadding,
                        padding: context.extremeAllPadding,
                        decoration: const BoxDecoration(color: AppColors.button, borderRadius: BorderRadi.lowCircular),
                        height: context.dynamicHeight(0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              index.toString(),
                              style: const TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                            ),
                            Text(
                              widget.currentUser!.username.toString(),
                              style: const TextStyle(color: AppColors.mainPrimary, fontSize: 12),
                            ),
                            Text(
                              context.read<HomeCubit>().allItems[index].price.toString(),
                              style: const TextStyle(color: AppColors.mainPrimary, fontSize: 16),
                            ),
                            Text(
                              context.read<HomeCubit>().allItems[index].name.toString(),
                              style: const TextStyle(color: AppColors.mainPrimary, fontSize: 25),
                            )
                            // Text(
                            //   context
                            //       .read<HomeCubit>()
                            //       .allItems[index]
                            //       .tourData
                            //       .tourFeatures[0]
                            //       .toString(),
                            //   style: TextStyle(
                            //       color: AppColors.mainPrimary, fontSize: 35),
                            //),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
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
                if (context.mounted) {
                  AutoRouter.of(context).replace(const LaunchRoute());
                }
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
              return Container(
                margin: context.extremeAllPadding,
                padding: context.extremeAllPadding,
                decoration: const BoxDecoration(color: AppColors.button, borderRadius: BorderRadi.lowCircular),
                height: context.dynamicHeight(0.3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.currentUser!.username.toString(),
                      style: const TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                    ),
                    Text(
                      context.read<HomeCubit>().allItems[0].price.toString(),
                      style: const TextStyle(color: AppColors.mainPrimary, fontSize: 35),
                    ),
                    Text(
                      context.read<HomeCubit>().allItems[index].tourData.tourFeatures[0].length.toString(),
                      style: const TextStyle(color: AppColors.mainPrimary, fontSize: 35),
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
