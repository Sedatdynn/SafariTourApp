part of '../view/register_view.dart';

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return SizedBox(
          width: context.width,
          child: ActiveButton(
            label: AppText.register.toUpperCase(),
            onPressed: context.read<RegisterCubit>().isLoading
                ? null
                : () {
                    final image = context.read<RegisterCubit>().image;
                    context.read<RegisterCubit>().postUserRegisterModel(image);
                  },
          ),
        );
      },
    );
  }
}
