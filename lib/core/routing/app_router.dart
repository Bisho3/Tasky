import 'package:todo/core/util/app_import.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      ///======== onBoarding ========///
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      ///======== authentication ========///
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());

      ///======== home ========///
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.addTaskScreen:
        final Map<String, dynamic> data = arguments as Map<String, dynamic>;
        final BuildContext previousContext =
            data[KeyRouter.previousContextInAddTaskScreen];
        return MaterialPageRoute(
            builder: (context) => AddTaskScreen(
                  previousContext: previousContext,
                ));
      case Routes.taskDetailsScreen:
        final Map<String, dynamic> data = arguments as Map<String, dynamic>;
        final String id = data[KeyRouter.taskIdInTaskDetailsScreen];
        final BuildContext mainContext =
            data[KeyRouter.contextInTaskDetailsScreen];

        return MaterialPageRoute(
            builder: (context) => TaskDetailsScreen(
                  id: id,
                  mainContext: mainContext,
                ));
      case Routes.scanTaskScreen:
        return MaterialPageRoute(builder: (context) => const ScanTaskScreen());

      ///======= profile ========///
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                      child: Text(
                          "${AppStrings.noRouteDefinedFor} ${settings.name.toString()}")),
                ));
    }
  }
}
