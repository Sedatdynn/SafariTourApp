part of '../view/launch.dart';

class _LaunchAuthButtons extends StatelessWidget {
  const _LaunchAuthButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.midAllPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ActiveButton(
              label: AppText.login,
              onPressed: () => NavigateTo.push(context, RouteEnum.login.withSlash),
              buttonColor: AppColors.white,
              textColor: AppColors.button,
            ),
          ),
          SizedBox(
            width: context.dynamicWidth(0.02),
          ),
          Expanded(
            child: ActiveButton(
                label: AppText.register, onPressed: () => NavigateTo.push(context, RouteEnum.register.withSlash)),
          ),
        ],
      ),
    );
  }
}
