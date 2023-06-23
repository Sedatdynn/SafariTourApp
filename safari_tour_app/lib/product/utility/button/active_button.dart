import '../../const/border/border_shape.dart';
import '../../const/theme/colors.dart';
import '../../extension/responsive/responsive.dart';
import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({super.key, required this.label, required this.onPressed, this.buttonColor, this.textColor});
  final String label;
  final Color? buttonColor;
  final Color? textColor;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: ShapedBorders.roundedLow,
        padding: context.midAllPadding,
        backgroundColor: buttonColor ?? AppColors.button,
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: onPressed == null ? AppColors.button.withOpacity(0.5) : (textColor ?? AppColors.white),
            ),
      ),
    );
  }
}
