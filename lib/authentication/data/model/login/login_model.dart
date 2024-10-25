import 'package:todo/core/util/app_import.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.token, required super.refreshToken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }
}
