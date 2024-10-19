import 'package:todo/core/util/app_import.dart';

class BottomOnboardingComponent extends StatelessWidget {
  const BottomOnboardingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CacheHelper.saveData(key: KeyConstance.onBoarding, value: true)
            .then((value) {
          context.pushAndRemoveUntil(
            routeName: Routes.loginScreen,
          );
        });
      },
      child: Container(
        margin: EdgeInsetsDirectional.all(
          AppDouble.fifteen.w,
        ),
        padding: EdgeInsetsDirectional.all(AppDouble.ten.w),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppDouble.twelve.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.letsStart,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            horizontalSpace(AppDouble.ten),
            SvgPicture.asset(AppIcons.arrowLeftIcon),
          ],
        ),
      ),
    );
  }
}
