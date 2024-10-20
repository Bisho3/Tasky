import '../util/app_import.dart';

class CustomFailureText extends StatelessWidget {
  const CustomFailureText({super.key, required this.failureText});

  final String failureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(AppDouble.five),
        Align(
          alignment: AlignmentDirectional.topStart,
          child: Text(
            failureText,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.redColor),
          ),
        ),
      ],
    );
  }
}
