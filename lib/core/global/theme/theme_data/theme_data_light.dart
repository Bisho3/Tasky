import 'package:todo/core/util/app_import.dart';

ThemeData getThemeDataLight() => ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.foreignLightColor,
      appBarTheme: _getAppBarTheme(),
      textTheme: _getTextTheme(),
      bottomNavigationBarTheme: _getBottomNavigatorBarTheme(),
      inputDecorationTheme: _getInputDecorationTheme(),
      textSelectionTheme: _getTextSelectionTheme(),
      textButtonTheme: _getTextButtonTheme(),
      switchTheme: _getSwitchTheme(),
      checkboxTheme: _getCheckboxTheme(),
    );

AppBarTheme _getAppBarTheme() => AppBarTheme(
      backgroundColor: AppColors.foreignLightColor,
      elevation: AppDouble.zero,
      titleSpacing: AppDouble.twenty.sp,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.foreignLightColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      surfaceTintColor: AppColors.transparentColor,
      actionsIconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: AppDouble.twentyFour.h,
      ),
      centerTitle: true,
      toolbarHeight: AppDouble.fifty.h,
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontSize: AppDouble.twenty.sp,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: AppDouble.twentyFour.h,
      ),
    );

TextTheme _getTextTheme() => TextTheme(
      bodyLarge: TextStyle(
        fontSize: AppDouble.twentyFour.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: AppDouble.eighteen.sp,
        color: AppColors.foreignLightColor,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        fontSize: AppDouble.fourteen.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.darkGreyColor,
      ),
      titleLarge: TextStyle(
          fontSize: AppDouble.sixteen.sp,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w700),
      // labelSmall: TextStyle(
      //     fontSize: AppDouble.ten.sp,
      //     color: AppColors.blackColor,
      //     fontWeight: FontWeight.w700),

      titleMedium: TextStyle(
        fontSize: AppDouble.eighteen.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.darkGreyColor,
      ),
      titleSmall: TextStyle(
        fontSize: AppDouble.twelve.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.darkGreyColor,
      ),
      // displaySmall: TextStyle(
      //   fontSize: AppDouble.seven.sp,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.blackColor,
      // ),

      headlineMedium: TextStyle(
        fontSize: 19.sp,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w500,
      ),
    );

InputDecorationTheme _getInputDecorationTheme() => InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 1.sw > 600 ? 0.03.sw : 0.05.sw,
        vertical: 1.sw > 600 ? 0.025.sh : 0.0.sh,
      ),
      labelStyle: TextStyle(
        fontSize: AppDouble.ten.sp,
        color: AppColors.greyColor,
      ),
      hintStyle: TextStyle(
        fontSize: AppDouble.ten.sp,
        color: AppColors.greyColor,
      ),
      errorStyle: TextStyle(
        fontSize: AppDouble.twelve.sp,
        color: AppColors.redColor,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(AppDouble.twelve),
      ),
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.circular(AppDouble.twelve)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.greyColor),
        borderRadius: BorderRadius.circular(AppDouble.twelve),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.redColor),
        borderRadius: BorderRadius.circular(AppDouble.twelve),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.redColor),
        borderRadius: BorderRadius.circular(AppDouble.twelve),
      ),
      fillColor: AppColors.transparentColor,
      filled: true,
    );

BottomNavigationBarThemeData _getBottomNavigatorBarTheme() =>
    const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      elevation: AppDouble.twenty,
      backgroundColor: AppColors.foreignLightColor,
    );

TextSelectionThemeData _getTextSelectionTheme() => const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    );

TextButtonThemeData _getTextButtonTheme() => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
      ),
    );

SwitchThemeData _getSwitchTheme() => SwitchThemeData(
      splashRadius: AppDouble.twenty.r,
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryColor;
        }
        if (states.contains(MaterialState.disabled)) {
          return AppColors.foreignLightColor;
        }
        return AppColors.foreignLightColor;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.veryLightGreyColor;
        }
        if (states.contains(MaterialState.disabled)) {
          return AppColors.foreignLightColor;
        }
        return AppColors.greyColor;
      }),
    );

CheckboxThemeData _getCheckboxTheme() => CheckboxThemeData(
      splashRadius: AppDouble.fifteen.r,
      side: const BorderSide(
        color: AppColors.primaryColor,
        width: AppDouble.two,
      ),
      checkColor: MaterialStateProperty.all(
        AppColors.foreignLightColor,
      ),
      shape: const CircleBorder(),
      fillColor: MaterialStateProperty.all(
        AppColors.primaryColor,
      ),
    );
