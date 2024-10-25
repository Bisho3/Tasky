import 'package:todo/core/util/app_import.dart';

abstract class BaseTaskyRepository {
  Future<Either<Failure, AddTask>> addTask(AddTaskParameter parameter);

  Future<Either<Failure, UploadImage>> uploadImage(
      UploadImageParameter parameter);

  Future<Either<Failure, Tasks>> getTasks();

  Future<Either<Failure, TaskDetails>> getTasksDetails(
      GetTaskDetailsParameter parameter);

  Future<Either<Failure, DeleteTask>> deleteTask(DeleteTaskParameter parameter);
}
