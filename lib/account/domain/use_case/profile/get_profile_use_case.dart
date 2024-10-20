import 'package:injectable/injectable.dart';
import 'package:todo/core/util/app_import.dart';

@lazySingleton
class ProfileUseCase extends BaseUseCase<Profile, NoParameters> {
  final BaseAccountRepository _baseAccountRepository;

  ProfileUseCase(this._baseAccountRepository);

  @override
  Future<Either<Failure, Profile>> call(NoParameters parameter) async {
    return await _baseAccountRepository.getProfile();
  }
}
