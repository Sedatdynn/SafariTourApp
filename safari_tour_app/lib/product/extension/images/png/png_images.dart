import 'package:flutter/material.dart';

import '../../../enums/images/image_enums.dart';

extension ImagePathExtension on ImagePaths {
  String get rawValue => "assets/png/$name.png";
  Widget toWidget({BoxFit? boxFit}) {
    return Image.asset(
      rawValue,
      fit: boxFit ?? BoxFit.contain,
    );
  }
}
