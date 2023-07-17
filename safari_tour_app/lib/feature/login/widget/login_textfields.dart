part of '../view/login_view.dart';

class _LoginTextFields extends StatelessWidget {
  const _LoginTextFields({
    required this.usernameController,
    required this.passwordController,
  });

  final TextEditingController usernameController;
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
            controller: passwordController,
            validator: (value) => (value ?? "").length >= 6 ? null : AppText.invalidPassword,
            hintText: AppText.password,
            keyboardType: TextInputType.emailAddress,
            secondIcon: Icons.visibility_outlined,
            firstIcon: Icons.visibility_off_outlined,
            passwordVisible: context.watch<LoginCubit>().isVisible,
            onPressed: context.read<LoginCubit>().changeVisible),
      ],
    );
  }
}
