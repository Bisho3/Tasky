import 'package:todo/core/util/app_import.dart';

class FloatingBottomComponent extends StatelessWidget {
  const FloatingBottomComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          onPressed: () {
            // context.pushNamed(routeName: Routes.addTaskScreen);
          },
          backgroundColor: AppColors.roseColor,
          shape: const CircleBorder(),
          mini: true,
          heroTag:  AppIntegers.one,
          child: SvgPicture.asset(AppIcons.scanIcon),
        ),
        verticalSpace(AppDouble.ten),
        FloatingActionButton(
          onPressed: () {
            context.pushNamed(routeName: Routes.addTaskScreen);
          },
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          heroTag:  AppIntegers.two,
          child: Icon(
            Icons.add,
            color: AppColors.foreignLightColor,
            size: AppDouble.twentyFive.h,

          ),
        ),
      ],
    );
  }
}
