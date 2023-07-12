import '../register_shelf.dart';
part '../widget/text_fields.dart';
part '../widget/top_text.dart';
part '../widget/picked_image.dart';

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

  AppBar buildCustomAppBar(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: context.watch<RegisterCubit>().isLoading,
        child: const CircularProgressIndicator(
          color: AppColors.mainPrimary,
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
          const RegisterTopTextWidget(),
          const ConstSpace(),
          PickedImageWidget(image: _image),
          Padding(
            padding: context.lowAllPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ActiveButton(
                    label: "Pick from gallery",
                    onPressed: () {
                      context.read<RegisterCubit>().getImage(
                            ImageSource.gallery,
                          );
                    },
                    buttonColor: AppColors.white,
                    textColor: AppColors.button,
                  ),
                ),
                SizedBox(
                  width: context.dynamicWidth(0.02),
                ),
                Expanded(
                  child: ActiveButton(
                    label: "Pick from camera",
                    onPressed: () {
                      context.read<RegisterCubit>().getImage(ImageSource.camera);
                    },
                  ),
                ),
              ],
            ),
          ),
          const ConstSpace(),
          RegisterTextFields(
              usernameController: usernameController,
              emailController: emailController,
              passwordController: passwordController),
          const ConstSpace(),
          buildRegisterButton(context),
          const ConstSpace(),
          buildBottomText(context),
        ],
      ),
    );
  }

  buildRegisterButton(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          child: ActiveButton(
            label: AppText.register.toUpperCase(),
            onPressed: context.read<RegisterCubit>().isLoading
                ? null
                : () {
                    _image = context.read<RegisterCubit>().image;
                    context.read<RegisterCubit>().postUserRegisterModel(_image);
                  },
          ),
        );
      },
    );
  }

  Widget buildBottomText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppText.haveAccount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.darkGrey.withOpacity(0.4),
              ),
        ),
        InkWell(
          onTap: () => NavigateTo.push(context, RouteEnum.login.withSlash),
          child: Text(
            AppText.login,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.mainPrimary),
          ),
        ),
      ],
    );
  }
}
