part of '../view/register_view.dart';

class _PickedImageWidget extends StatelessWidget {
  const _PickedImageWidget({
    required File? image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return ClipOval(
          child: context.read<RegisterCubit>().image != null
              ? Image.file(
                  context.read<RegisterCubit>().image!,
                  height: 160,
                )
              : ImagePaths.safari.toWidget(context: context),
        );
      },
    );
  }
}
