import 'package:todo/core/util/app_import.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoardingScreen());

/*      ///======== authentication ========///
      case Routes.mapScreen:
        final Map<String, dynamic> data = arguments as Map<String, dynamic>;
        final int typeMap = data[KeyRouter.typeMapInMapScreenKey];
        return MaterialPageRoute(
            builder: (context) => MapScreen(typeMap: typeMap));*/
      // case Routes.chooseTypeOfRegisterScreen:
      //   final Map<String, dynamic>? data = arguments as Map<String, dynamic>?;
      //   final bool? isLogOut = data?[KeyRouter.isLogOutInChooseTypeRegister];
      //   return MaterialPageRoute(
      //       builder: (context) => ChooseTypeOfRegisterScreen(
      //             isLogOut: isLogOut ?? true,
      //             isWallet: false,
      //           ));

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
