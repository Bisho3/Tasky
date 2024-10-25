import 'package:todo/core/util/app_import.dart';

class ItemHeaderProgressComponent extends StatelessWidget {
  const ItemHeaderProgressComponent({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onTap,
  });

  final String text;
  final bool isActive;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: AppDouble.ten.w,
          vertical: AppDouble.eight.w,
        ),
        decoration: BoxDecoration(
          color:
              isActive ? AppColors.primaryColor : AppColors.lightPrimaryColor,
          borderRadius: BorderRadius.circular(AppDouble.forty.w),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: isActive ? AppColors.foreignLightColor : null,
                fontWeight: isActive ? FontWeight.w700 : null,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
