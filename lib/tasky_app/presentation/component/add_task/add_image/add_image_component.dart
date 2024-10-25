import 'package:todo/core/util/app_import.dart';

class AddImageComponent extends StatelessWidget {
  const AddImageComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskyCubit, TaskyState>(
      buildWhen: (previous, current) =>
          previous.uploadImage != current.uploadImage ||
          previous.failureImage != current.failureImage ||
          previous.removeImageState != current.removeImageState,
      builder: (context, state) {
        if (state.uploadImage != null && state.uploadImage!.path.isNotEmpty) {
          return ImageComponent(
            images: state.uploadImage!.path,
            removeImage: () {
              context.read<TaskyCubit>().removeImage();
            },
          );
        } else {
          return GestureDetector(
            onTap: () {
              showTakeImgOptions(
                context: context,
              );
            },
            child: DottedBorder(
              color: state.failureImage == UploadImageStates.failure
                  ? AppColors.redColor
                  : AppColors.primaryColor,
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(AppDouble.eight.h),
              padding: EdgeInsets.all(AppDouble.ten.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppIcons.addImageIcon),
                  horizontalSpace(AppDouble.ten),
                  Text(
                    AppStrings.addImg,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
