import '../register_shelf.dart';
part '../widget/text_fields.dart';
part '../widget/top_text.dart';
part '../widget/picked_image.dart';
part '../widget/bottom_auth_texts.dart';
part '../widget/register_button.dart';
part '../widget/pick_image.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  File? _image;

  final GlobalKey<FormState> formKey = GlobalKey();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(formKey, usernameController, emailController, passwordController, _image,
          service: RegisterService(ProjectNetworkManager.instance.service)),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) async {
          if (state is RegisterLoaded) {
            NavigateTo.push(context, RouteEnum.login.withSlash);
          }
        },
        builder: (context, state) {
          return buildMainBody(context, state);
        },
      ),
    );
  }

  Scaffold buildMainBody(BuildContext context, RegisterState state) {
    return Scaffold(
      body: Padding(
        padding: context.extremeAllPadding,
        child: buildFormBody(
          state,
          context,
        ),
      ),
    );
  }

  Form buildFormBody(
    RegisterState state,
    BuildContext context,
  ) {
    return Form(
      key: formKey,
      autovalidateMode: state is RegisterValidateState
          ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
          : AutovalidateMode.disabled,
      child: buildScrollBody(
        context,
      ),
    );
  }

  SingleChildScrollView buildScrollBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ConstSpace(height: context.dynamicHeight(0.05)),
          const _RegisterTopTextWidget(),
          const ConstSpace(),
          _PickedImageWidget(image: _image),
          Padding(
            padding: context.lowAllPadding,
            child: const _PickImageWidget(),
          ),
          const ConstSpace(),
          _RegisterTextFields(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController),
          const ConstSpace(),
          const _RegisterButton(),
          const ConstSpace(),
          const _BottomAuthTexts(),
        ],
      ),
    );
  }
}
