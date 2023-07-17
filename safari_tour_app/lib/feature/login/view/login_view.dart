import '../login_shelf.dart';

part '../widget/bottom_auth_texts.dart';
part '../widget/login_button.dart';
part '../widget/login_textfields.dart';
part '../widget/login_app_bar.dart';
part '../widget/login_text.dart';

@RoutePage()
class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(formKey, usernameController, passwordController,
          service: LoginService(ProjectNetworkManager.instance.service)),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) async {
          if (state is LoginComplete) {
            state.navigate(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const _LoginAppBar(),
            body: buildFormBody(state, context),
          );
        },
      ),
    );
  }

  Form buildFormBody(LoginState state, BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: state is LoginValidateState
          ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      child: Padding(
        padding: context.extremeAllPadding,
        child: buildMainBody(context),
      ),
    );
  }

  SingleChildScrollView buildMainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImagePaths.safari.toWidget(context: context),
          ConstSpace(
            height: context.dynamicHeight(0.05),
          ),
          const _LoginText(),
          const ConstSpace(),
          _LoginTextFields(usernameController: usernameController, passwordController: passwordController),
          const ConstSpace(),
          const _LoginButton(),
          const ConstSpace(),
          const _BottomAuthTexts(),
        ],
      ),
    );
  }
}
