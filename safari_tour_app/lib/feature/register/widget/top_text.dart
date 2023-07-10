part of '../view/register_view.dart';

class RegisterTopTextWidget extends StatelessWidget {
  const RegisterTopTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppText.register,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.black),
      ),
    );
  }
}
