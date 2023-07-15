import 'package:flutter/material.dart';

import '../../product/const/theme/colors.dart';

///  class to define the properties of [ThemeData].
@immutable
final class ITheme {
  const ITheme._();
  static ThemeData get appTheme => ThemeData(primarySwatch: AppColors.primarySwatch, appBarTheme: _appBarTheme);
  static AppBarTheme get _appBarTheme => const AppBarTheme(
      elevation: 0, backgroundColor: AppColors.transparent, iconTheme: IconThemeData(color: AppColors.button));
}
