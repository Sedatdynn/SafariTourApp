import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../enums/images/image_enums.dart';

extension ImagePathExtension on ImagePaths {
  String get rawValue => "assets/svg/$name.svg";
  Widget toSvg({BoxFit? boxFit, required BuildContext context}) {
    return SvgPicture.asset(
      rawValue,
    );
  }
}
