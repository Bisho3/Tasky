import 'package:todo/core/util/app_import.dart';

class CustomMaterialButton extends StatelessWidget {
  final double? width;
  final Function function;
  final String? text;
  final double? radius;
  final Color lightModeMaterialColor;
  final bool borderColorSameMaterial;
  final Color lightModeTextColor;
  final bool loading;
  final double fontSize;
  final bool wantWeight400;

  const CustomMaterialButton(
      {super.key,
      required this.function,
      required this.text,
      this.width = double.infinity,
      this.radius = 12,
      this.lightModeTextColor = AppColors.foreignLightColor,
      this.lightModeMaterialColor = AppColors.primaryColor,
      this.loading = false,
      this.borderColorSameMaterial = false,
      this.fontSize = AppDouble.sixteen,
      this.wantWeight400 = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: lightModeMaterialColor,
          borderRadius: BorderRadius.circular(
            radius!,
          ),
          border: Border.all(
            color: borderColorSameMaterial == false
                ? AppColors.primaryColor
                : lightModeMaterialColor,
          )),
      child: MaterialButton(
        onPressed: loading
            ? null
            : () {
                function();
              },
        child: loading
            ? Center(
                child: SpinKitThreeBounce(
                    color: AppColors.foreignLightColor,
                    size: 1.sw < 600 ? 0.04.sh : 0.06.sh),
              )
            : Text(text.toString(),
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: lightModeTextColor,
                      fontSize: fontSize.sp,
                    )),
      ),
    );
  }
}
