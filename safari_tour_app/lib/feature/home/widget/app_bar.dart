part of '../view/home_view.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () async {
              SharedManager.instance.removeItem(SharedKeys.access);
              if (context.mounted) {
                NavigateTo.replace(context, RouteEnum.launch.withSlash);
              }
            },
            icon: const Icon(Icons.logout_outlined))
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(context.dynamicHeight(0.08));
}
