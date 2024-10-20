import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class LogOutUseCase extends BaseUseCase<LogOut, NoParameters> {
  final BaseAuthRepository _baseAuthRepository;

  LogOutUseCase(this._baseAuthRepository);

  @override
  Future<Either<Failure, LogOut>> call(NoParameters parameter) async {
    return await _baseAuthRepository.logOut();
  }
}
