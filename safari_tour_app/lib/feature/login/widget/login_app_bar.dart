part of '../view/login_view.dart';

class _LoginAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _LoginAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: context.watch<LoginCubit>().isLoading,
        child: const CircularProgressIndicator(
          color: AppColors.button,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
