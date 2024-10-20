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
  AppConstance.onBoarding =
      await CacheHelper.getData(key: KeyConstance.onBoarding);
  AppConstance.refreshToken =
      await CacheHelper.getSecureData(key: KeyConstance.refreshToken);

  /// ==========token for testing ===================///
  debugPrint("token ${AppConstance.token}");
  debugPrint("token ${AppConstance.refreshToken}");
  debugPrint("onboarding ${AppConstance.onBoarding}");

  ///====== logic for start route ====///
  late String startRoutes;
  if (AppConstance.onBoarding != null && AppConstance.token != null) {
    startRoutes = Routes.homeScreen;
  } else if (AppConstance.onBoarding != null && AppConstance.token == null) {
    startRoutes = Routes.loginScreen;
  } else {
    // todo : onBoarding
    startRoutes = Routes.onBoardingScreen;
  }

  runApp(MyApp(
    appRouter: AppRouter(),
    startRoute: startRoutes,
  ));
}
