import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                height: 700,
                child: ListView.builder(
                  itemCount: context.read<HomeCubit>().allItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(
                          context.read<HomeCubit>().allItems[index].name ?? "",
                          style: TextStyle(color: Colors.green, fontSize: 35),
                        ),
                        Text(
                          context
                              .read<HomeCubit>()
                              .allItems[index]
                              .id
                              .toString(),
                          style: TextStyle(color: Colors.green, fontSize: 35),
                        ),
                        Text(
                          context
                                  .read<HomeCubit>()
                                  .allItems[index]
                                  .imageCover ??
                              "",
                          style: TextStyle(color: Colors.green, fontSize: 35),
                        ),
                        Text(
                          context.read<HomeCubit>().allItems[index].url ?? "",
                          style: TextStyle(color: Colors.green, fontSize: 35),
                        ),
                      ],
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
