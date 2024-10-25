import 'package:todo/core/util/app_import.dart';

class CustomPopUpTask extends StatelessWidget {
  const CustomPopUpTask(
      {super.key, required this.onTapEdit, required this.onTapDelete});

  final Function onTapEdit;

  final Function onTapDelete;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      color: AppColors.foreignLightColor,
      menuPadding: EdgeInsetsDirectional.symmetric(
        horizontal: AppDouble.fifteen.w,
        vertical: AppDouble.zero.w,
      ),
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 200),
        reverseCurve: Curves.easeIn,
        reverseDuration: const Duration(milliseconds: 200),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            onTapEdit();
          },
          child: Text(
            AppStrings.edit,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        const PopupMenuDivider(
          height: AppDouble.one,
        ),
        PopupMenuItem(
          onTap: () {
            onTapDelete();
          },
          child: Text(
            AppStrings.delete,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.deepOrangeColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
