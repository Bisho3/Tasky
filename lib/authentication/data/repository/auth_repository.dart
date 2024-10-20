import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseAuthRepository)
class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDataSource _baseAuthRemoteDataSource;

  AuthRepository(this._baseAuthRemoteDataSource);

  @override
  Future<Either<Failure, Login>> login(LoginParameter parameter) async {
    try {
      final result = await _baseAuthRemoteDataSource.login(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SignUp>> signUp(SignUpParameter parameter) async {
    try {
      final result = await _baseAuthRemoteDataSource.signUp(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
