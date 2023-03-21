import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

import '../../border/border_radi.dart';
import '../../theme/colors.dart';

class ProductTextFieldDecoration extends InputDecoration {
  ProductTextFieldDecoration(
      BuildContext context,
      String? hintText,
      IconData? firstIcon,
      IconData? secondIcon,
      bool? passwordVisible,
      VoidCallback? onPressed)
      : super(
            contentPadding: context.lowAllPadding,
            enabledBorder: focusedBorderStyle(context),
            focusedBorder: focusedBorderStyle(context),
            border: standardBorder(context),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.mainPrimary,
                ),
            suffixIcon: IconButton(
              icon: Icon(
                (passwordVisible ?? false) ? firstIcon : secondIcon,
                color: AppColors.mainPrimary,
              ),
              onPressed: onPressed,
            ));

  static OutlineInputBorder focusedBorderStyle(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: AppColors.button,
        width: context.dynamicWidth(0.005),
      ),
    );
  }

  static OutlineInputBorder standardBorder(BuildContext context) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(
          color: AppColors.lightGrey,
          width: context.dynamicWidth(0.1),
        ),
      );

  static BorderRadius get borderRadius => BorderRadi.lowMedCircular;
}
