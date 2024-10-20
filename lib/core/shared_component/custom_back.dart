import 'package:todo/core/util/app_import.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({
    super.key,
    this.whenBack,
  });

  final Function? whenBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (whenBack != null) {
          whenBack!();
        }
        context.pop();
      },
      child: Row(
        children: [
          horizontalSpace(AppDouble.ten.w),
          SvgPicture.asset(
            AppIcons.backIcon,
            height: AppDouble.fifteen.h,
          ),
        ],
      ),
    );
  }
}
