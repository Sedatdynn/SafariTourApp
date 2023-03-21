import 'package:flutter/material.dart';
import 'package:safari_tour_app/product/extension/responsive/responsive.dart';

class ConstSpace extends StatelessWidget {
  const ConstSpace({
    super.key,
    this.height,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? context.dynamicHeight(0.025),
      width: context.dynamicWidth(0.02),
    );
  }
}
