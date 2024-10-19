import '../util/app_import.dart';

class CustomFailureText extends StatelessWidget {
  const CustomFailureText({super.key, required this.failureText});

  final String failureText;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(
        failureText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.redColor),
      ),
    );
  }
}
