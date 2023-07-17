part of '../view/login_view.dart';

class _BottomAuthTexts extends StatelessWidget {
  const _BottomAuthTexts();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppText.doNotHaveAccount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGrey.withOpacity(0.4),
              ),
        ),
        InkWell(
          onTap: () => NavigateTo.push(context, RouteEnum.register.withSlash),
          child: Text(
            AppText.register,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.mainPrimary),
          ),
        ),
      ],
    );
  }
}
