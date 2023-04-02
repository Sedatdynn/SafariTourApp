import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/const/theme/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // remove();
    return const Scaffold(
        body: Center(
            child: CircularProgressIndicator(
      color: AppColors.mainPrimary,
    )));
  }

  remove() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("access");
  }
}
