part of '../view/register_view.dart';

class _PickImageWidget extends StatelessWidget {
  const _PickImageWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
