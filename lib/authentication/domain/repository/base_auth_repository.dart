import 'package:todo/core/util/app_import.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, SignUp>> signUp(SignUpParameter parameter);

  Future<Either<Failure, Login>> login(LoginParameter parameter);

  Future<Either<Failure, LogOut>> logOut();
}
