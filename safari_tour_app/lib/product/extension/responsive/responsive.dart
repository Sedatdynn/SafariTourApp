import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double dynamicHeight(double value) => height * value;
  double dynamicWidth(double value) => width * value;
}

extension AllPaddings on BuildContext {
  EdgeInsets get zeroAllPadding => const EdgeInsets.all(0);
  EdgeInsets get lowAllPadding => const EdgeInsets.all(8);
  EdgeInsets get midAllPadding => const EdgeInsets.all(16);
  EdgeInsets get extremeAllPadding => const EdgeInsets.all(24);
}

extension HorizontalPadding on BuildContext {
  EdgeInsets get lowHorizontal => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get midHorizontal => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get extremeHorizontal =>
      const EdgeInsets.symmetric(horizontal: 24);
}

extension VerticalPadding on BuildContext {
  EdgeInsets get lowVertical => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get midVertical => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get extremeHorizontal => const EdgeInsets.symmetric(vertical: 24);
}
