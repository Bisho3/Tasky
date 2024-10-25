import 'package:todo/core/util/app_import.dart';
import 'package:injectable/injectable.dart';

abstract class BaseTaskyRemoteDataSource {
  Future<AddTaskModel> addTask(AddTaskParameter parameter);

  Future<UploadImageModel> uploadImage(UploadImageParameter parameter);

  Future<TasksModel> getTasks();

  Future<TaskDetailsModel> getTaskDetails(GetTaskDetailsParameter parameter);

  Future<DeleteTaskModel> deleteTask(DeleteTaskParameter parameter);
}

@LazySingleton(as: BaseTaskyRemoteDataSource)
class TaskyRemoteDataSource extends BaseTaskyRemoteDataSource {
  @override
  Future<AddTaskModel> addTask(AddTaskParameter parameter) async {
    try {
      final response = await DioHelper.postData(
          url: ApiConstance.addTaskPath,
          token: AppConstance.token,
          data: {
            "title": parameter.taskTitle,
            "desc": parameter.taskDescription,
            "priority": parameter.priority,
            "dueDate": parameter.duiDate,
            "image": parameter.image
          });
      if (response.statusCode == AppIntegers.twoHundredAndOne) {
        return const AddTaskModel();
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response);
    }
  }

  @override
  Future<UploadImageModel> uploadImage(UploadImageParameter parameter) async {
    try {
      final FormData formData = FormData.fromMap({
        "image": await MultipartFile.fromFile(
          parameter.image.path,
          filename: parameter.image.path.split('/').last,
          contentType: DioMediaType('image', 'png'),
        ),
      });

      final response = await DioHelper.postData(
          url: ApiConstance.uploadImage,
          token: AppConstance.token,
          wantMultiForm: true,
          data: formData);
      if (response.statusCode == AppIntegers.twoHundredAndOne) {
        return UploadImageModel.fromJson(response.data);
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response);
    }
  }

  @override
  Future<TasksModel> getTasks() async {
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.addTaskPath,
        token: AppConstance.token,
      );
      if (response.statusCode == AppIntegers.twoHundred) {
        return TasksModel.fromJson(response.data);
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response);
    }
  }

  @override
  Future<TaskDetailsModel> getTaskDetails(
      GetTaskDetailsParameter parameter) async {
    try {
      final response = await DioHelper.getData(
        url: ApiConstance.getTaskDetailsPath(id: parameter.id),
        token: AppConstance.token,
      );
      if (response.statusCode == AppIntegers.twoHundred) {
        return TaskDetailsModel.fromJson(response.data);
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response);
    }
  }

  @override
  Future<DeleteTaskModel> deleteTask(DeleteTaskParameter parameter) async {
    try {
      final response = await DioHelper.deleteData(
        url: ApiConstance.getTaskDetailsPath(id: parameter.id),
        token: AppConstance.token,
      );
      if (response.statusCode == AppIntegers.twoHundred) {
        return const DeleteTaskModel();
      } else {
        throw handlerError(response: response.data);
      }
    } on DioException catch (e) {
      throw handlerError(response: e.response);
    }
  }
}
