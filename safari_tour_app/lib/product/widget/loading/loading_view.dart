import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: AppColors.mainPrimary,
    )));
  }
}
