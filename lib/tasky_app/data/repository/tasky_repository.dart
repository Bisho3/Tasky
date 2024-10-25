import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseTaskyRepository)
class TaskyRepository extends BaseTaskyRepository {
  final BaseTaskyRemoteDataSource _baseTaskyRemoteDataSource;

  TaskyRepository(this._baseTaskyRemoteDataSource);

  @override
  Future<Either<Failure, AddTask>> addTask(AddTaskParameter parameter) async {
    try {
      final result = await _baseTaskyRemoteDataSource.addTask(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, UploadImage>> uploadImage(
      UploadImageParameter parameter) async {
    try {
      final result = await _baseTaskyRemoteDataSource.uploadImage(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Tasks>> getTasks() async {
    try {
      final result = await _baseTaskyRemoteDataSource.getTasks();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TaskDetails>> getTasksDetails(
      GetTaskDetailsParameter parameter) async {
    try {
      final result = await _baseTaskyRemoteDataSource.getTaskDetails(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DeleteTask>> deleteTask(
      DeleteTaskParameter parameter) async {
    try {
      final result = await _baseTaskyRemoteDataSource.deleteTask(parameter);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
