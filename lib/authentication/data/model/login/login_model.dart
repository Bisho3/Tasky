import 'package:todo/core/util/app_import.dart';

class LoginModel extends Login {
  const LoginModel({
    required super.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json["access_token"],
    );
  }
}
