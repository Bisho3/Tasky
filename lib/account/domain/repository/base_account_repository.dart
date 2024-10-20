import 'package:todo/core/util/app_import.dart';

abstract class BaseAccountRepository {
  Future<Either<Failure, Profile>> getProfile();
}
