import 'package:todo/core/util/app_import.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    configureDependencies(),
    ScreenUtil.ensureScreenSize(),
  ]);
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );


  AppConstance.token = await CacheHelper.getSecureData(key: KeyConstance.token);

  /// ==========token for testing ===================///
  debugPrint("token ${AppConstance.token}");


  ///====== logic for start route ====///
  late String startRoutes;
  // if (AppConstance.onBoarding != null && AppConstance.location != null) {
    // todo : choose type delivery screen
    // startRoutes = Routes.chooseTypeDeliveryScreen;

    startRoutes = Routes.onBoardingScreen;
/*  } else {
    // todo : onBoarding
    startRoutes = Routes.onBoardingScreen;
  }*/


  runApp(MyApp(
    appRouter: AppRouter(),
    startRoute: startRoutes,
  ));
}

