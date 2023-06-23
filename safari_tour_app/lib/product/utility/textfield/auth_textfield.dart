import 'package:flutter/material.dart';

import '../../const/decoration/textFieldDeco/textfield_deco.dart';
import '../../const/theme/colors.dart';

class ProductTextField extends StatelessWidget {
  const ProductTextField({
    required this.validator,
    super.key,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.passwordVisible,
    this.onPressed,
    this.firstIcon,
    this.secondIcon,
  });
  final String? Function(String?) validator;
  final String? hintText;
  final TextInputType? keyboardType;

  final TextEditingController? controller;
  final bool? passwordVisible;
  final VoidCallback? onPressed;
  final IconData? firstIcon;
  final IconData? secondIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: passwordVisible ?? false,
      cursorColor: AppColors.mainPrimary,
      decoration: ProductTextFieldDecoration(
        context,
        hintText,
        firstIcon,
        secondIcon,
        passwordVisible,
        onPressed,
      ),
      validator: validator,
    );
  }
}
