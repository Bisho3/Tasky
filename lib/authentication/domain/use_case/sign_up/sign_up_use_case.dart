import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignUpUseCase extends BaseUseCase<SignUp, SignUpParameter> {
  final BaseAuthRepository _baseAuthRepository;

  SignUpUseCase(this._baseAuthRepository);

  @override
  Future<Either<Failure, SignUp>> call(SignUpParameter parameter) async {
    return await _baseAuthRepository.signUp(parameter);
  }
}

class SignUpParameter extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String password;
  final String experienceYear;
  final String address;
  final String level;

  const SignUpParameter({
    required this.fullName,
    required this.phoneNumber,
    required this.password,
    required this.experienceYear,
    required this.address,
    required this.level,
  });

  @override
  List<Object> get props => [
        fullName,
        phoneNumber,
        password,
        address,
        level,
        experienceYear,
      ];
}
