import '../launch_shelf.dart';

part '../widget/auth_buttons.dart';
part '../widget/welcome_image.dart';

@RoutePage()
class LaunchView extends StatelessWidget {
  const LaunchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScaffoldBody(context),
    );
  }

  Column buildScaffoldBody(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_WelcomeImage(), _LaunchAuthButtons()],
    );
  }
}
