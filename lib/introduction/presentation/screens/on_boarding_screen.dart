import 'package:todo/core/util/app_import.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Image.asset(AppImages.enterTasksImage)),
          verticalSpace(AppDouble.ten),
          Text(
            AppStrings.titleOnBoarding,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          verticalSpace(AppDouble.fifteen),
          Text(
            AppStrings.bodyOnBoarding,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: AppDouble.onePointFive,
                ),
            textAlign: TextAlign.center,
          ),
          verticalSpace(AppDouble.ten),
          const BottomOnboardingComponent(),
        ],
      ),
    );
  }
}
