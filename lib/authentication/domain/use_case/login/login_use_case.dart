import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class LoginUseCase extends BaseUseCase<Login, LoginParameter> {
  final BaseAuthRepository _baseAuthRepository;

  LoginUseCase(this._baseAuthRepository);

  @override
  Future<Either<Failure, Login>> call(LoginParameter parameter) async {
    return await _baseAuthRepository.login(parameter);
  }
}

class LoginParameter extends Equatable {
  final String phone, password;

  const LoginParameter({
    required this.phone,
    required this.password,
  });

  @override
  List<Object?> get props => [
        phone,
        password,
      ];
}
