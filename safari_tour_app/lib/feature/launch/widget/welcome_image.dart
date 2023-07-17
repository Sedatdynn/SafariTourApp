part of '../view/launch.dart';

class _WelcomeImage extends StatelessWidget {
  const _WelcomeImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.dynamicHeight(0.8),
      child: ImagePaths.welcome.toSvg(context: context),
    );
  }
}
