import 'package:todo/core/util/app_import.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({
    super.key,
    this.whenBack,
    this.lightModeColor = AppColors.primaryColor,
    this.icon = Icons.arrow_back_ios,
  });

  final Function? whenBack;
  final Color lightModeColor;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (whenBack != null) {
          whenBack!();
        }
        context.pop();
      },
      child: Icon(
        icon,
        size: AppDouble.twentyTwo.w,
        color:  lightModeColor,
      ),
    );
  }
}
