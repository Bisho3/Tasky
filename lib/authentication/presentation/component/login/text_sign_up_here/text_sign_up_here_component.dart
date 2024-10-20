import 'package:todo/core/util/app_import.dart';

class TextSignUpHereComponent extends StatelessWidget {
  const TextSignUpHereComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            AppStrings.doNotHaveAccount,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(routeName: Routes.registerScreen);
          },
          child: Text(
            " ${AppStrings.signUpHere}",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  decorationColor: AppColors.primaryColor,
                  decoration: TextDecoration.underline,
                ),
          ),
        ),
      ],
    );
  }
}
