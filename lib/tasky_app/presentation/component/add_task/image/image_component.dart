import 'package:todo/core/util/app_import.dart';
import 'package:flutter/cupertino.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    super.key,
    required this.images,
    required this.removeImage,
    this.width = AppDouble.eighty,
  });

  final String images;
  final Function removeImage;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDouble.eight),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDouble.twenty),
            child: Image.file(
              File(images),
              width: width?.w,
              height: AppIntegers.oneHundred.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            removeImage();
          },
          child: CircleAvatar(
            radius: AppDouble.ten,
            backgroundColor: AppColors.redColor,
            child: Icon(
              CupertinoIcons.xmark,
              color: AppColors.foreignLightColor,
              size: AppDouble.fifteen.h,
            ),
          ),
        ),
      ],
    );
  }
}
