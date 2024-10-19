import 'package:todo/core/util/app_import.dart';

class CustomSmallBottomText extends StatelessWidget {
  const CustomSmallBottomText(
      {super.key,
      required this.text,
      this.lightModeColor = AppColors.primaryColor,
      required this.onTap});

  final String text;
  final Color lightModeColor;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color:
        lightModeColor,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
