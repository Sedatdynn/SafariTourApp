part of '../view/login_view.dart';

class _LoginText extends StatelessWidget {
  const _LoginText();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppText.login,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.black),
      ),
    );
  }
}
