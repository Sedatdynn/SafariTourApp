part of '../view/register_view.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductTextField(
          controller: usernameController,
          validator: (value) => (value ?? "").length >= 4 ? null : AppText.invalidUsername,
          hintText: AppText.exampleUsername,
          keyboardType: TextInputType.text,
        ),
        const ConstSpace(),
        ProductTextField(
          controller: emailController,
          validator: (value) => (value ?? "").contains("@") ? null : AppText.invalidMail,
          hintText: AppText.exampleMail,
          keyboardType: TextInputType.emailAddress,
        ),
        const ConstSpace(),
        ProductTextField(
          controller: passwordController,
          validator: (value) => (value ?? "").length >= 6 ? null : AppText.invalidPassword,
          hintText: AppText.password,
          keyboardType: TextInputType.emailAddress,
          secondIcon: Icons.visibility_outlined,
          firstIcon: Icons.visibility_off_outlined,
          passwordVisible: context.watch<RegisterCubit>().isVisible,
          onPressed: context.read<RegisterCubit>().changeVisible,
        ),
      ],
    );
  }
}
