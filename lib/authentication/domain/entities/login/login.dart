import 'package:todo/core/util/app_import.dart';

class Login extends Equatable {
  final String token;
  final String refreshToken;

  const Login({
    required this.token,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [token, refreshToken];
}
