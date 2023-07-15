part of '../view/register_view.dart';

class _RegisterTopTextWidget extends StatelessWidget {
  const _RegisterTopTextWidget();

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
