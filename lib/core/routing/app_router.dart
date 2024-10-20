import 'package:todo/core/util/app_import.dart';
import 'package:todo/tasky_app/presentation/screens/add_task/add_task_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      ///======== onBoarding ========///
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

/*      ///======== authentication ========///
      case Routes.mapScreen:
        final Map<String, dynamic> data = arguments as Map<String, dynamic>;
        final int typeMap = data[KeyRouter.typeMapInMapScreenKey];
        return MaterialPageRoute(
            builder: (context) => MapScreen(typeMap: typeMap));*/

      ///======== authentication ========///
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case Routes.registerScreen:
        return MaterialPageRoute(builder: (context) => RegisterScreen());

      ///======== home ========///
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.addTaskScreen:
        return MaterialPageRoute(builder: (context) =>  AddTaskScreen());

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
