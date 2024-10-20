import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseAccountRepository)
class AccountRepository extends BaseAccountRepository {
  final BaseAccountRemoteDataSource _baseAccountRemoteDataSource;

  AccountRepository(this._baseAccountRemoteDataSource);

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final result = await _baseAccountRemoteDataSource.getProfile();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
