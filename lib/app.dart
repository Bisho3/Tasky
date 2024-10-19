import 'package:todo/core/util/app_import.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String startRoute;

  const MyApp({
    super.key,
    required this.appRouter,
    required this.startRoute,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
            AppDouble.threeHundredAndSixty, AppDouble.sixHundredAndNinety),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            locale: const Locale(AppConstance.langEn),
            supportedLocales: const [
              Locale(AppConstance.langEn),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (currentLang, supportLang) {
              for (Locale locale in supportLang) {
                if (currentLang != null &&
                    locale.languageCode == currentLang.languageCode) {
                  return currentLang;
                }
              }
              return supportLang.first;
            },
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            theme: getThemeDataLight(),
            themeMode: ThemeMode.light,
            initialRoute: startRoute,
            onGenerateRoute: appRouter.generateRoute,
            useInheritedMediaQuery: true,
          );
        },
        child: const SizedBox());
  }
}
