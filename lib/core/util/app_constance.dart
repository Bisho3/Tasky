import 'package:todo/core/util/app_import.dart';

class AppConstance {
  static String? token;
  static String? refreshToken;
  static bool? onBoarding;

  ///======= language =====///

  static const String langEn = "en";

  ///=========== states =======///

  static const waitingState  = "waiting";
  static const finishedState  = "finished";
  static const inProgressState  = "inprogress";

  ///======= PRIOORTY =========///

  static const String highPriority = "high";
  static const String mediumPriority = "medium";
  static const String lowPriority = "low";

  ///========== base url ====///

  static String baseImageUrl({required String image}) =>
      "${ApiConstance.baseUrl}/images/$image";

}
