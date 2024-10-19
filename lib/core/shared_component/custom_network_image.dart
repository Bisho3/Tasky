import 'package:skeletonizer/skeletonizer.dart';
import 'package:todo/core/util/app_import.dart';

class CustomNetworkImage extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final BorderRadiusGeometry? border;
  final BoxShape shape;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.image,
    this.width = double.infinity,
    this.height = 180,
    this.border,
    this.shape = BoxShape.rectangle,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image.toString(),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: border,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
          shape: shape,
        ),
      ),

      ///=== is dark baseColor = grey[800]! & hightLightColor = grey[850]! ===///
      placeholder: (context, url) => Skeletonizer(
        enabled:  true,
        child: Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
              color: AppColors.blackColor, borderRadius: border, shape: shape),
        ),
      ),
      errorWidget: (context, url, error) => SvgPicture.asset(
        AppImages.logoImage,
        color: Theme.of(context).primaryColor,
        height: height.h,
        width: width.w,
      ),
      height: height.h,
      fit: BoxFit.cover,
      width: width.w,
    );
  }
}
