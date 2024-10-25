import 'package:todo/core/util/app_import.dart';

class ItemCardComponent extends StatelessWidget {
  const ItemCardComponent({
    super.key,
    this.wantPrefixIcon = false,
    this.wantTitle = false,
    this.wantArrow = false,
    required this.title,
  });

  final bool wantPrefixIcon;
  final bool wantTitle;
  final String title;
  final bool wantArrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: AppDouble.ten.w,
        horizontal: AppDouble.twenty.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightPrimaryColor,
        borderRadius: BorderRadius.circular(AppDouble.twelve.w),
      ),
      child: Row(
        children: [
          if (wantPrefixIcon == true) SvgPicture.asset(AppIcons.priorityIcon),
          if (wantPrefixIcon == true) horizontalSpace(AppDouble.ten),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (wantTitle == true)
                Text(AppStrings.endDate,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: AppDouble.nine.sp,
                        )),
              if (wantTitle == true) verticalSpace(AppDouble.two),
              Text(title,
                  style: wantTitle == true
                      ? Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.blackColor,
                          )
                      : Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.primaryColor)),
            ],
          ),
          const Spacer(),
          wantArrow == true
              ? Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).primaryColor,
                  size: AppDouble.twentyFive.w,
                )
              : SvgPicture.asset(AppIcons.calendarIcon),
        ],
      ),
    );
  }
}
