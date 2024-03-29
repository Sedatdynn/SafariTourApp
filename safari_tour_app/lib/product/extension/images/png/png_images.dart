import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

import '../../../enums/images/image_enums.dart';

extension ImagePathExtension on ImagePaths {
  String get rawValue => "assets/png/$name.png";
  Widget toWidget(
      {BoxFit? boxFit,
      Color? color,
      double? height,
      required BuildContext context}) {
    return Image.asset(
      rawValue,
      height: height ?? context.dynamicHeight(0.3),
      fit: boxFit ?? BoxFit.contain,
      color: color,
    );
  }
}
