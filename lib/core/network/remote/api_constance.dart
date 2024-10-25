class ApiConstance {
  ///===== base url =====///
  static const String baseUrl = "https://todo.iraqsapp.com";

  ///===== login =====///

  static const String loginPath = "$baseUrl/auth/login";

  ///===== register =====///

  static const String registerPath = "$baseUrl/auth/register";

  ///===== profile =====///
  static const String profilePath = "$baseUrl/auth/profile";

  ///===== refresh Token =====///

  static const String refreshTokenPath = "$baseUrl/auth/refresh-token";

  ///===== logout =====///

  static const String logoutPath = "$baseUrl/auth/logout";

  ///===== add task =====///

  static const String addTaskPath = "$baseUrl/todos";

  ///===== get task details =====///

  static String getTaskDetailsPath({required String id}) =>
      "$baseUrl/todos/$id";

  ///============ upload image ============///

  static const String uploadImage = "$baseUrl/upload/image";
}
