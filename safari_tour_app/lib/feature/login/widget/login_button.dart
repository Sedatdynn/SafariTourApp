part of '../view/login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          child: ActiveButton(
            label: AppText.login.toUpperCase(),
            onPressed: context.watch<LoginCubit>().isLoading
                ? null
                : () {
                    context.read<LoginCubit>().postUserModel();
                  },
          ),
        );
      },
    );
  }
}
