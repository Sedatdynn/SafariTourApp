import 'package:flutter/material.dart';

import '../../product/const/theme/colors.dart';

///  class to define the properties of [ThemeData].
@immutable
class ITheme {
  const ITheme();
  ThemeData get appTheme => ThemeData(primarySwatch: AppColors.primarySwatch, appBarTheme: _appBarTheme);
  AppBarTheme get _appBarTheme => const AppBarTheme(
      elevation: 0, backgroundColor: AppColors.transparent, iconTheme: IconThemeData(color: AppColors.button));
}
